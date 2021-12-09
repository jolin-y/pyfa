package com.ruoyi.drdc.common;

import com.deepoove.poi.XWPFTemplate;
import com.ruoyi.common.annotation.Word;
import com.ruoyi.common.annotation.Words;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.UtilException;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.*;
import java.util.stream.Collectors;

/**
 * word工具类
 * Poi-tl模板引擎官方文档：http://deepoove.com/poi-tl/
 */
public class WordUtil<T>
{
    private static final Logger log = LoggerFactory.getLogger(WordUtil.class);

    /**
     * word名称
     */
    private String wordName;

    /**
     * 注解列表
     */
    private List<Object[]> fields;

    /**
     * 导入导出数据列表
     */
    private List<T> list;

    /**
     * 导出类型（EXPORT:导出数据；IMPORT：导入模板）
     */
    private Word.Type type;

//    /**
//     * 最大高度
//     */
//    private short maxHeight;

    /**
     * 实体对象
     */
    public Class<T> clazz;

    public WordUtil(Class<T> clazz)
    {
        this.clazz = clazz;
    }

    public void init(List<T> list, String wordName, Word.Type type)
    {
        if (list == null)
        {
            list = new ArrayList<T>();
        }
        this.list = list;
        this.type = type;
        this.wordName =wordName;
        createWordField();
    }


    public AjaxResult exportWord(List<T> list, String wordName)
    {
        this.init(list, wordName, Word.Type.EXPORTWORD);
        return exportWord();
    }



    /**
     * 根据模板填充内容生成word，并下载
     *
     * @return 结果
     */
    public AjaxResult exportWord()
    {
        OutputStream out = null;
        try
        {
            Map<String, Object> paramMap = getParamMap();
//            Map<String, Object> paramMap = getParamMap2();
//            HackLoopTableRenderPolicy  policy = new HackLoopTableRenderPolicy();
//            Configure config = Configure.newBuilder().bind("GJteacher_List", policy).build();


            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjTeacher_template.docx";
//            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjTeacher_template2.docx";

            String filename = encodingFilename(wordName);
            out = new FileOutputStream(getAbsoluteFile(filename));

            XWPFTemplate template = XWPFTemplate.compile(templatePath).render(paramMap);
//            XWPFTemplate template = XWPFTemplate.compile(templatePath,config).render(paramMap);

            template.write(out);//将template写到OutputStream中
            out.flush();
            out.close();
            template.close();


//            wb.write(out);
            return AjaxResult.success(filename);
//            return null;
        }
        catch (Exception e)
        {
            log.error("导出Word异常{}", e.getMessage());
            throw new UtilException("导出Word失败，请联系网站管理员！");
        }
//        finally
//        {
////            IOUtils.closeQuietly(wb);
////            IOUtils.closeQuietly(out);
//        }
    }


    /**
     * 写入模板需要的数据到Word
     * 学历统计信息
     */
    public Map<String, Object> getParamMap()
    {
        Map<String, Object> params = new HashMap<>();
        params.put("teacherNum",list.size());

        try {
            int boshiNum = 0;
            int shuoshiNum = 0;
            int benkeNum = 0;

            Map<Object, Integer> degreeMap = new HashMap<>();

            for (int index = 0; index < list.size(); index++)
            {
                T vo = (T) list.get(index);
                int column = 0;
                for (Object[] os : fields)
                {
                    Field field = (Field) os[0];
                    Word word = (Word) os[1];

                    Object value = getTargetValue(vo, field, word);
                    String dateFormat = word.dateFormat();
                    String readConverterExp = word.readConverterExp();
                    String separator = word.separator();
                    String dictType = word.dictType();
                    if (StringUtils.isNotEmpty(readConverterExp) && StringUtils.isNotNull(value))
                    {
                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);

                        Integer counts = degreeMap.get(convertValue);
                        degreeMap.put(convertValue, counts == null ? 1 : ++counts);

//                        if (convertValue.equals("博士研究生"))
//                        {
//                            boshiNum += 1;
//                        }
//                        else if (convertValue.equals("硕士研究生"))
//                        {
//                            shuoshiNum += 1;
//                        }
//                        else if (convertValue.equals("大学本科"))
//                        {
//                            benkeNum += 1;
//                        }
                    }
//                    else {
//                        Integer counts = degreeMap.get(value);
//                        degreeMap.put(value, counts == null ? 1 : ++counts);
//                    }
                }
            }


//            params.put("boshiNum",boshiNum);
//            params.put("shuoshiNum",shuoshiNum);
//            params.put("benkeNum",benkeNum);


//            System.out.println(degreeMap);    // {硕士研究生=2, 博士研究生=2, 大学本科=5}
//            System.out.println(degreeMap.values());
//            System.out.println(degreeMap.keySet());
//            System.out.println(degreeMap.containsKey("博士研究生"));

//            {硕士研究生=2, teacherNum=9, 博士研究生=2, 大学本科=5}
            degreeMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));

//            System.out.println(params);

        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

        return params;
    }



    /**
     * 写入模板需要的数据到Word
     * 教师信息 表格
     */
    public Map<String, Object> getParamMap2()
    {
        Map<String, Object> params = new HashMap<>();
        params.put("teacherNum",list.size());

        try {
//            int boshiNum = 0;
//            int shuoshiNum = 0;
//            int benkeNum = 0;

            List<Map<String, Object>> teacherMapResult = new ArrayList<>();
            Map<String, Object> teacherMap;

            for (int index = 0; index < list.size(); index++)
            {
                teacherMap = new HashMap<>();


                T vo = (T) list.get(index);
                int column = 0;
                for (Object[] os : fields)
                {
                    Field field = (Field) os[0];
                    Word word = (Word) os[1];

                    String fieldStr = field.getName();

                    Object value = getTargetValue(vo, field, word);
                    String dateFormat = word.dateFormat();
                    String readConverterExp = word.readConverterExp();
                    String separator = word.separator();
                    String dictType = word.dictType();
                    if (StringUtils.isNotEmpty(readConverterExp) && StringUtils.isNotNull(value))
                    {
                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);
                        teacherMap.put(fieldStr, convertValue);

                    }
                    else {
                        teacherMap.put(fieldStr, value);

                    }

                }
                teacherMapResult.add(teacherMap);
            }

            params.put("GJteacher_List",teacherMapResult);


        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

        return params;
    }



//    /**
//     * list转Map<String,Object>
//     *     获得教师信息的map
//     */
//    public static List<Map<String, Object>> toListMap(List<CGjTeacher> userList) {
//        List<Map<String, Object>> result = new ArrayList<>();
//        Map<String, Object> teacherMap;
//        for (CGjTeacher user : userList) {
//            teacherMap = new HashMap<>();
//            teacherMap.put("teacherId", user.getTeacherId());
//            teacherMap.put("teacherName", user.getTeacherName());
//            teacherMap.put("degree", user.getDegreeId());
//            result.add(teacherMap);
//        }
//        return result;
//    }






    /**
     * 解析导出值 0=男,1=女,2=未知
     *
     * @param propertyValue 参数值
     * @param converterExp 翻译注解
     * @param separator 分隔符
     * @return 解析后值
     */
    public static String convertByExp(String propertyValue, String converterExp, String separator)
    {
        StringBuilder propertyString = new StringBuilder();
        String[] convertSource = converterExp.split(",");
        for (String item : convertSource)
        {
            String[] itemArray = item.split("=");
            if (StringUtils.containsAny(separator, propertyValue))
            {
                for (String value : propertyValue.split(separator))
                {
                    if (itemArray[0].equals(value))
                    {
                        propertyString.append(itemArray[1] + separator);
                        break;
                    }
                }
            }
            else
            {
                if (itemArray[0].equals(propertyValue))
                {
                    return itemArray[1];
                }
            }
        }
        return StringUtils.stripEnd(propertyString.toString(), separator);
    }



    /**
     * 获取bean中的属性值
     *
     * @param vo 实体对象
     * @param field 字段
     * @param word 注解
     * @return 最终的属性值
     * @throws Exception
     */
    private Object getTargetValue(T vo, Field field, Word word) throws Exception
    {
        Object o = field.get(vo);
        if (StringUtils.isNotEmpty(word.targetAttr()))
        {
            String target = word.targetAttr();
            if (target.indexOf(".") > -1)
            {
                String[] targets = target.split("[.]");
                for (String name : targets)
                {
                    o = getValue(o, name);
                }
            }
            else
            {
                o = getValue(o, target);
            }
        }
        return o;
    }

    /**
     * 以类的属性的get方法方法形式获取值
     *
     * @param o
     * @param name
     * @return value
     * @throws Exception
     */
    private Object getValue(Object o, String name) throws Exception
    {
        if (StringUtils.isNotNull(o) && StringUtils.isNotEmpty(name))
        {
            Class<?> clazz = o.getClass();
            Field field = clazz.getDeclaredField(name);
            field.setAccessible(true);
            o = field.get(o);
        }
        return o;
    }



    /**
     * 得到所有定义字段
     */
    private void createWordField()
    {
        this.fields = getFields();
        this.fields = this.fields.stream().sorted(Comparator.comparing(objects -> ((Word) objects[1]).sort())).collect(Collectors.toList());
//        this.maxHeight = getRowHeight();
    }

    /**
     * 获取字段注解信息
     */
    public List<Object[]> getFields()
    {
        List<Object[]> fields = new ArrayList<Object[]>();
        List<Field> tempFields = new ArrayList<>();
        tempFields.addAll(Arrays.asList(clazz.getSuperclass().getDeclaredFields()));
        tempFields.addAll(Arrays.asList(clazz.getDeclaredFields()));
        for (Field field : tempFields)
        {
            // 单注解
            if (field.isAnnotationPresent(Word.class))
            {
                Word attr = field.getAnnotation(Word.class);
                if (attr != null && (attr.type() == Word.Type.ALLWORD || attr.type() == type))
                {
                    field.setAccessible(true);
                    fields.add(new Object[] { field, attr });
                }
            }

            // 多注解
            if (field.isAnnotationPresent(Words.class))
            {
                Words attrs = field.getAnnotation(Words.class);
                Word[] excels = attrs.value();
                for (Word attr : excels)
                {
                    if (attr != null && (attr.type() == Word.Type.ALLWORD || attr.type() == type))
                    {
                        field.setAccessible(true);
                        fields.add(new Object[] { field, attr });
                    }
                }
            }
        }
        return fields;
    }

    /**
     * 编码文件名
     */
    public String encodingFilename(String filename)
    {
        filename = UUID.randomUUID().toString() + "_" + filename + ".docx";
        return filename;
    }

    /**
     * 获取下载路径
     *
     * @param filename 文件名称
     */
    public String getAbsoluteFile(String filename)
    {
        String downloadPath = RuoYiConfig.getDownloadPath() + filename;
        File desc = new File(downloadPath);
        if (!desc.getParentFile().exists())
        {
            desc.getParentFile().mkdirs();
        }
        return downloadPath;
    }



}
