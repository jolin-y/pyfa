package com.ruoyi.drdc.common;

import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.config.Configure;
import com.deepoove.poi.data.RowRenderData;
import com.deepoove.poi.data.style.TableStyle;
import com.deepoove.poi.policy.HackLoopTableRenderPolicy;
import com.ruoyi.common.annotation.Word;
import com.ruoyi.common.annotation.Words;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.CGjXyzy;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.UtilException;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.drdc.domain.ViewGjZyjc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STJc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * word工具类
 * Poi-tl模板引擎官方文档：http://deepoove.com/poi-tl/
 */
public class WordUtil<T>
{
//    @Autowired
//    private ICGjXyzyService icGjXyzyService;

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

    public AjaxResult exportWord6(List<T> list, String wordName)
    {
        this.init(list, wordName, Word.Type.EXPORTWORD);
        return exportWord6();
    }

    public AjaxResult exportWord5(List<T> list, String wordName)
    {
        this.init(list, wordName, Word.Type.EXPORTWORD);
        return exportWord5();
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
//            Map<String, Object> paramMap = getParamMap();

//            Map<String, Object> paramMap = getParamMap2();
//            HackLoopTableRenderPolicy  policy = new HackLoopTableRenderPolicy();
//            Configure config = Configure.newBuilder().bind("GJteacher_List", policy).build();

//            Map<String, Object> paramMap = getParamMap3();
            Map<String, Object> paramMap = getParamMap4();
            HackLoopTableRenderPolicy policy = new HackLoopTableRenderPolicy();
            Configure config = Configure.newBuilder().bind("GJxyzy_List", policy).build();


//            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjTeacher_template.docx";
//            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjTeacher_template2.docx";
            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjXyzy_template.docx";

            String filename = encodingFilename(wordName);
            out = new FileOutputStream(getAbsoluteFile(filename));

//            XWPFTemplate template = XWPFTemplate.compile(templatePath).render(paramMap);
            XWPFTemplate template = XWPFTemplate.compile(templatePath,config).render(paramMap);

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
                T vo = list.get(index);
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


                T vo = list.get(index);
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



    /**
     * 写入模板需要的数据到Word
     *  适用于树结构的学院专业表
     */
    public Map<String, Object> getParamMap3()
    {
        Map<String, Object> params = new HashMap<>();
//        params.put("xyzy_num",list.size());

        try {
//            学科门类、专业类别、备注信息
            Map<Object, Integer> xkzyDictMap = new HashMap<>();

//            学科专业
            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
            Map<String, Object> xkzyMap;

            for (int index = 0; index < list.size(); index++)
            {

                xkzyMap = new HashMap<>();

                T vo = list.get(index);

//                // 取年份
//                if (((CGjXyzy) vo).getParentId() == 0)
//                {
//                    params.put("xyzyYear",((CGjXyzy) vo).getYear());
//                }

//                int column = 0;

//                String daiMa = ((CGjXyzy) vo).getXyzyDaima();

//                int ancestorNum = ((CGjXyzy) vo).getAncestors().split(",").length;
//                if (ancestorNum == 3)
                if (getXyzyChildList(list, (CGjXyzy) vo).size() == 0)
                {
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
//                            没用到
                            Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);

//                        Integer counts = xkzyDictMap.get(convertValue);
//                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);

                            xkzyMap.put(fieldStr, convertValue);

                        }
                        else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
                        {
//                            学科门类、专业类别、备注信息
                            Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);

                            // 只存学科门类
                            if (fieldStr.equals("xkml")) {
                                Integer counts = xkzyDictMap.get(convertValue);
                                xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);
                            }

                            xkzyMap.put(fieldStr, convertValue);

                        }
                        else {
                            xkzyMap.put(fieldStr, value);  // 专业名称

//                            ((CGjXyzy) vo).getParentId(); //学院id

                            for (int index2 = 0; index2 < list.size(); index2++) {

                                T vo2 = list.get(index2);

                                if (((CGjXyzy) vo2).getXyzyId() == ((CGjXyzy) vo).getParentId())
                                {
                                    xkzyMap.put("xyName", ((CGjXyzy) vo2).getXyzyName());  // 学院名称

                                    List<CGjXyzy> xyzyChildList = getXyzyChildList(list, (CGjXyzy) vo2);  // 学院的子专业节点
                                    xkzyMap.put("zyNum", xyzyChildList.size());  // 专业数量

//                                    xkzyMap.put("zyNum", ((CGjXyzy) vo2).getChildNum());  // 专业数量


//                                    List<CGjXyzy> childlist=new ArrayList<>();
//                                   icGjXyzyService.getChildList(childlist,(CGjXyzy) vo2);
//                                   for(CGjXyzy list:childlist){
//                                       System.out.println(list);
//                                   }

                                    break;
                                }
                            }

                        }
                    }
                    xkzyMapResult.add(xkzyMap);
                }

            }

//            {工学=2, 预警=1}
            xkzyDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));

            params.put("GJxyzy_List",xkzyMapResult);

            params.put("xyzyNum",xkzyMapResult.size());
            params.put("xkmlNum",xkzyDictMap.size());

            params.put("xkmlKeys",xkzyDictMap.keySet().toString());
//            xkzyDictMap.keySet().toString()


        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

        return params;
    }




    /**
     * 写入模板需要的数据到Word
     *  适用于列表结构的学院专业表
     */
    public Map<String, Object> getParamMap4()
    {
        Map<String, Object> params = new HashMap<>();
//        params.put("xyzy_num",list.size());

        try {
//            学科门类
            Map<Object, Integer> xkmlDictMap = new HashMap<>();

//            学科专业
            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
            Map<String, Object> xkzyMap;

            // 根据学院名对list分组，用于计算专业数量
            Map<String, List<ViewGjZyjc>> xyzycollect = new HashMap<>();
            for (ViewGjZyjc gjZyjc : (List<ViewGjZyjc>)list) {
                xyzycollect.computeIfAbsent(String.valueOf(gjZyjc.getDeptName()), k -> new ArrayList<>()).add(gjZyjc);
            }


            for (int index = 0; index < list.size(); index++)
            {

                xkzyMap = new HashMap<>();

                T vo = list.get(index);


//                // 取年份
//                if (((CGjXyzy) vo).getParentId() == 0)
//                {
//                    params.put("xyzyYear",((CGjXyzy) vo).getYear());
//                }

//                int column = 0;

//                String daiMa = ((CGjXyzy) vo).getXyzyDaima();

//                int ancestorNum = ((CGjXyzy) vo).getAncestors().split(",").length;
//                if (ancestorNum == 3)

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
//                            没用到
                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);

//                        Integer counts = xkzyDictMap.get(convertValue);
//                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);

                        xkzyMap.put(fieldStr, convertValue);

                    }
                    else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
                    {
//                            学科门类、专业类别、备注信息
                        Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);

                        // 只存学科门类
                        if (fieldStr.equals("xkml")) {
                            Integer counts = xkmlDictMap.get(convertValue);
                            xkmlDictMap.put(convertValue, counts == null ? 1 : ++counts);
                        }

                        xkzyMap.put(fieldStr, convertValue);

                    }
                    else {
                        if (fieldStr.equals("zyName")) {
                            xkzyMap.put(fieldStr, value);  // 专业名称
                        }
                        if (fieldStr.equals("deptName")) {
                            xkzyMap.put(fieldStr, value);  // 学院名称

                            // 统计学院下的专业个数
                            xkzyMap.put("zyNum",xyzycollect.get(value).size());
                        }
                    }
                }
                xkzyMapResult.add(xkzyMap);

            }


//            {工学=2,}
//            xkmlDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));

            params.put("GJxyzy_List",xkzyMapResult);

            params.put("xyzyNum",xkzyMapResult.size());
            params.put("xkmlNum",xkmlDictMap.size());

            params.put("xkmlKeys",xkmlDictMap.keySet().toString());
//            xkzyDictMap.keySet().toString()



            List<String> xkmlList = Arrays.asList("工学","艺术学","法学","理学","管理学","经济学","文学");
//            if xkmlDictMap.get()
            xkmlList.forEach(item ->{
                if (xkmlDictMap.get(item) != null){
                    params.put(item,xkmlDictMap.get(item));

//                    params.put(item+"率",((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size())*100 +"%");
                    params.put(item+"率",new DecimalFormat("#.##%").format((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size()));
                }
                else {
                    params.put(item, 0);
                    params.put(item + "率", "0%");
                }
            });


        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

        return params;
    }





    /**
     * 根据模板填充内容生成word，并下载
     *
     * @return 结果
     */
    public AjaxResult exportWord5()
    {
        OutputStream out = null;
        try
        {

//            Map<String, Object> allData = getParamMap5();
//            Map<String, Object> data = (Map<String, Object>) allData.get("params");
//            ZyjcData zyjcDatas = (ZyjcData)allData.get("zyjcDatas");


//            Map<String, Object> allData = getParamMap5();
//            ZyjcData zyjcDatas = (ZyjcData) allData.get("zyjcDatas");
            ZyjcData allData = getParamMap5();
//            ZyjcData zyjcDatas = (ZyjcData) allData.get("zyjcDatas");



            HackLoopTableRenderPolicy policy = new HackLoopTableRenderPolicy();
            Configure config = Configure.newBuilder().bind("GJzyjc_Table", new DynamicTablePolicy()).build();


            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjZyjc_template5.docx";

            String filename = encodingFilename(wordName);
            out = new FileOutputStream(getAbsoluteFile(filename));

//            XWPFTemplate template = XWPFTemplate.compile(templatePath).render(paramMap);
//            XWPFTemplate template = XWPFTemplate.compile(templatePath,config).render(zyjcDatas);
            XWPFTemplate template = XWPFTemplate.compile(templatePath,config).render(allData);

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



//    /**
//     * 写入模板需要的数据到Word
//     *  适用于列表结构的学院专业表
//     *  尝试合并单元格
//     */
//    public Map<String, Object> getParamMap5()
//    {
////        Map<String, Object> allData = new HashMap<>();
//
//        Map<String, Object> params = new HashMap<>();
//
//        ZyjcData zyjcDatas = new ZyjcData();
//        XkzyData xkzyTable = new XkzyData();
//        List<RowRenderData> xkzyDetailLists = new ArrayList<RowRenderData>();
//        List<Map<String,Object>> xyZyNumLists = new ArrayList<Map<String,Object>>();
//
//        TableStyle rowStyle = new TableStyle();
//        rowStyle = new TableStyle();
//        rowStyle.setAlign(STJc.CENTER);
//
//
//        try {
////            学科门类
//            Map<Object, Integer> xkmlDictMap = new HashMap<>();
//
////            学科专业
//            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
//            Map<String, Object> xkzyMap;
//
//            // 根据学院名对list分组，用于计算专业数量
//            Map<String, List<ViewGjZyjc>> xyzycollect = new HashMap<>();
//            for (ViewGjZyjc gjZyjc : (List<ViewGjZyjc>)list) {
//                xyzycollect.computeIfAbsent(String.valueOf(gjZyjc.getDeptName()), k -> new ArrayList<>()).add(gjZyjc);
//            }
//
//
//            for (int index = 0; index < list.size(); index++)
//            {
//
//                xkzyMap = new HashMap<>();
//
//                T vo = list.get(index);
//
//
//                String deptName = "";
//                String zyNum = "";
//                String zyName = "";
//                String xkml = "";
//                String remarks = "";
//
//
//                for (Object[] os : fields)
//                {
//                    Field field = (Field) os[0];
//                    Word word = (Word) os[1];
//
//                    String fieldStr = field.getName();
//
//                    Object value = getTargetValue(vo, field, word);
//                    String dateFormat = word.dateFormat();
//                    String readConverterExp = word.readConverterExp();
//                    String separator = word.separator();
//                    String dictType = word.dictType();
//                    if (StringUtils.isNotEmpty(readConverterExp) && StringUtils.isNotNull(value))
//                    {
////                            没用到
//                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);
//
//                        xkzyMap.put(fieldStr, convertValue);
//
//                    }
//                    else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
//                    {
////                            学科门类、专业类别、备注信息
//                        Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);
//
//                        // 只存学科门类
//                        if (fieldStr.equals("xkml")) {
//                            Integer counts = xkmlDictMap.get(convertValue);
//                            xkmlDictMap.put(convertValue, counts == null ? 1 : ++counts);
//
//                            xkml = (String) convertValue;
//                        }
//                        if (fieldStr.equals("remarks")) {
//
//                            remarks = (String) convertValue;
//                        }
//
//                        xkzyMap.put(fieldStr, convertValue);
//
//
//                    }
//                    else {
//                        if (fieldStr.equals("zyName")) {
//                            xkzyMap.put(fieldStr, value);  // 专业名称
//
//                            zyName = (String) value;
//                        }
//                        if (fieldStr.equals("deptName")) {
//                            xkzyMap.put(fieldStr, value);  // 学院名称
//
//                            // 统计学院下的专业个数
//                            xkzyMap.put("zyNum",xyzycollect.get(value).size());
//
//
//                            deptName = (String) value;
//                            zyNum = String.valueOf(xyzycollect.get(value).size());
//
//
//                            String finalDeptName = deptName;
//                            int repeatNum = (int) xyZyNumLists.stream().filter(item -> item.get("deptName").equals(finalDeptName)).count();
//
//                            if (repeatNum == 0){
//                                Map<String,Object> xyZyNumMap = new HashMap<String, Object>();
//                                xyZyNumMap.put("deptName", deptName);
//                                xyZyNumMap.put("zyNum",zyNum);
//                                xyZyNumLists.add(xyZyNumMap);
//                            }
//
//
//
//                        }
//                    }
//                }
//
//                xkzyMapResult.add(xkzyMap);
//
//                RowRenderData xkzyDetailList = RowRenderData.build(deptName,zyNum,zyName+' '+remarks,xkml);
//                xkzyDetailList.setRowStyle(rowStyle);
//                xkzyDetailLists.add(xkzyDetailList);
//            }
//
//            xkzyTable.setXkzyDetailLists(xkzyDetailLists);
//            xkzyTable.setXyZyNumLists(xyZyNumLists);
////            zyjcDatas.setXkzyTable(xkzyTable);
//
//
//
////            {工学=2,}
////            xkmlDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));
//
////            params.put("GJzyjc_Table",xkzyMapResult);
//
//            params.put("xyzyNum",xkzyMapResult.size());
//            params.put("xkmlNum",xkmlDictMap.size());
//
//            params.put("xkmlKeys",xkmlDictMap.keySet().toString());
////            xkzyDictMap.keySet().toString()
//
//
//
//            List<String> xkmlList = Arrays.asList("工学","艺术学","法学","理学","管理学","经济学","文学");
////            if xkmlDictMap.get()
//            xkmlList.forEach(item ->{
//                if (xkmlDictMap.get(item) != null){
//                    params.put(item,xkmlDictMap.get(item));
//
////                    params.put(item+"率",((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size())*100 +"%");
//                    params.put(item+"率",new DecimalFormat("#.##%").format((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size()));
//                }
//                else {
//                    params.put(item, 0);
//                    params.put(item + "率", "0%");
//                }
//            });
//
//
//        }catch (Exception e)
//        {
//            log.error("导出Word失败{}", e);
//        }
//
////        xkzyTable.setParams(params);
//        zyjcDatas.setXkzyTable(xkzyTable);
//
////        allData.put("params",params);
////        allData.put("zyjcDatas",zyjcDatas);
////        return allData;
//        params.put("GJzyjc_Table",zyjcDatas);
//        return params;
//    }




    /**
     * 写入模板需要的数据到Word
     *  适用于列表结构的学院专业表
     *  尝试合并单元格
     *  DynamicTablePolicy
     */
//    public Map<String, Object> getParamMap5()
    public ZyjcData getParamMap5()
    {
//        Map<String, Object> allData = new HashMap<>();

        Map<String, Object> params = new HashMap<>();

        List<Map<String,Object>> typeLists = new ArrayList<Map<String,Object>>();

        ZyjcData zyjcDatas = new ZyjcData();
        XkzyData xkzyTable = new XkzyData();
        List<RowRenderData> xkzyDetailLists = new ArrayList<RowRenderData>();
        List<Map<String,Object>> xyZyNumLists = new ArrayList<Map<String,Object>>();

        TableStyle rowStyle = new TableStyle();
        rowStyle = new TableStyle();
        rowStyle.setAlign(STJc.CENTER);


        try {
//            学科门类
            Map<Object, Integer> xkmlDictMap = new HashMap<>();

//            学科专业
            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
            Map<String, Object> xkzyMap;

            // 根据学院名对list分组，用于计算专业数量
            Map<String, List<ViewGjZyjc>> xyzycollect = new HashMap<>();
            for (ViewGjZyjc gjZyjc : (List<ViewGjZyjc>)list) {
                xyzycollect.computeIfAbsent(String.valueOf(gjZyjc.getDeptName()), k -> new ArrayList<>()).add(gjZyjc);
            }


            for (int index = 0; index < list.size(); index++)
            {

                xkzyMap = new HashMap<>();

                T vo = list.get(index);


                String deptName = "";
                String zyNum = "";
                String zyName = "";
                String xkml = "";
                String remarks = "";


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
//                            没用到
                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);

//                        Integer counts = xkzyDictMap.get(convertValue);
//                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);

                        xkzyMap.put(fieldStr, convertValue);

                    }
                    else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
                    {
//                            学科门类、专业类别、备注信息
                        Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);

                        // 只存学科门类
                        if (fieldStr.equals("xkml")) {
                            Integer counts = xkmlDictMap.get(convertValue);
                            xkmlDictMap.put(convertValue, counts == null ? 1 : ++counts);

                            xkml = (String) convertValue;
                        }
                        if (fieldStr.equals("remarks")) {

                            remarks = (String) convertValue;
                        }

                        xkzyMap.put(fieldStr, convertValue);



                    }
                    else {
                        if (fieldStr.equals("zyName")) {
                            xkzyMap.put(fieldStr, value);  // 专业名称

                            zyName = (String) value;
                        }
                        if (fieldStr.equals("deptName")) {
                            xkzyMap.put(fieldStr, value);  // 学院名称

                            // 统计学院下的专业个数
                            xkzyMap.put("zyNum",xyzycollect.get(value).size());


                            deptName = (String) value;
                            zyNum = String.valueOf(xyzycollect.get(value).size());


//                            String finalDeptName = deptName;
//                            xyZyNumLists.forEach(item -> {
//                                if(item.get("deptName") == finalDeptName){
//                                    System.out.println(finalDeptName);
//                                }
//                            });

//                            int num = 0;
//                            for(int i = 0;i<xyZyNumLists.size();i++){
//                                if(xyZyNumLists.get(i).get("deptName").equals(finalDeptName)){
//                                    System.out.println(finalDeptName);
//                                    num += 1;
//                                }
//                            }
//
//                            Map<String,Object> xyZyNumMap = new HashMap<String, Object>();
//                            xyZyNumMap.put("deptName", deptName);
//                            xyZyNumMap.put("zyNum",zyNum);
//                            xyZyNumLists.add(xyZyNumMap);

                            String finalDeptName = deptName;
                            int repeatNum = (int) xyZyNumLists.stream().filter(item -> item.get("deptName").equals(finalDeptName)).count();

                            if (repeatNum == 0){
                                Map<String,Object> xyZyNumMap = new HashMap<String, Object>();
                                xyZyNumMap.put("deptName", deptName);
                                xyZyNumMap.put("zyNum",zyNum);
                                xyZyNumLists.add(xyZyNumMap);
                            }



                        }
                    }
                }

                xkzyMapResult.add(xkzyMap);

                RowRenderData xkzyDetailList = RowRenderData.build(deptName,zyNum,zyName+' '+remarks,xkml);
                xkzyDetailList.setRowStyle(rowStyle);
                xkzyDetailLists.add(xkzyDetailList);
            }

            xkzyTable.setXkzyDetailLists(xkzyDetailLists);
            xkzyTable.setXyZyNumLists(xyZyNumLists);
//            zyjcDatas.setXkzyTable(xkzyTable);



//            {工学=2,}
//            xkmlDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));

            params.put("GJzyjc_Table",xkzyMapResult);

            params.put("xyzyNum",xkzyMapResult.size());
            params.put("xkmlNum",xkmlDictMap.size());

            params.put("xkmlKeys",xkmlDictMap.keySet().toString());
//            xkzyDictMap.keySet().toString()



            List<String> xkmlList = Arrays.asList("工学","艺术学","法学","理学","管理学","经济学","文学");
//            if xkmlDictMap.get()
            xkmlList.forEach(item ->{
                if (xkmlDictMap.get(item) != null){
                    params.put(item,xkmlDictMap.get(item));

//                    params.put(item+"率",((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size())*100 +"%");
                    params.put(item+"率",new DecimalFormat("#.##%").format((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size()));
                }
                else {
                    params.put(item, 0);
                    params.put(item + "率", "0%");
                }
            });


        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

////        xkzyTable.setParams(params);
        zyjcDatas.setXkzyTable(xkzyTable);
//
////        allData.put("params",params);
//
//        allData.put("zyjcDatas",zyjcDatas);
//        return allData;
//        params.put("GJzyjc_Table", xkzyTable);
        typeLists.add(params);
        zyjcDatas.setTypeLists(typeLists);

        return zyjcDatas;
    }



    /**
     * 根据模板填充内容生成word，并下载
     *适用于列表结构的学院专业表
     *尝试合并单元格
     * WorderToNewWordUtils
     * 失败 无法渲染文本段落
     * @return 结果
     */
    public AjaxResult exportWord6()
    {
        OutputStream out = null;
        try
        {
            String templatePath = "E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\src\\main\\resources\\static\\template\\gjZyjc_template.docx";

            Map<String, Object> allData = getParamMap6();
            Map<String, Object> data = (Map<String, Object>) allData.get("params");
            List<Object> mapList = (List<Object>) allData.get("mapList");

            //需要动态改变表格的位置；第一个表格的位置为0
            int[] placeList = {1,};

            CustomXWPFDocument doc = WorderToNewWordUtils.changWord(templatePath,data,mapList,placeList);
//            FileOutputStream fopts = new FileOutputStream("D:/呵呵.docx");
            String filename = encodingFilename(wordName);
            out = new FileOutputStream(getAbsoluteFile(filename));
            doc.write(out);
            out.close();
            out.flush();



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
     *  适用于列表结构的学院专业表
     *  尝试合并单元格
     *  WorderToNewWordUtils
     */
    public Map<String, Object> getParamMap6()
    {
        Map<String, Object> allData = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        //需要进行动态生成的信息
        List<Object> mapList = new ArrayList<Object>();
//        params.put("xyzy_num",list.size());


        List<String[]> xkzyDetailLists = new ArrayList<String[]>();


        try {
//            学科门类
            Map<Object, Integer> xkmlDictMap = new HashMap<>();

//            学科专业
            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
            Map<String, Object> xkzyMap;

            // 根据学院名对list分组，用于计算专业数量
            Map<String, List<ViewGjZyjc>> xyzycollect = new HashMap<>();
            for (ViewGjZyjc gjZyjc : (List<ViewGjZyjc>)list) {
                xyzycollect.computeIfAbsent(String.valueOf(gjZyjc.getDeptName()), k -> new ArrayList<>()).add(gjZyjc);
            }


            for (int index = 0; index < list.size(); index++)
            {

                xkzyMap = new HashMap<>();

                T vo = list.get(index);


                String deptName = "";
                String zyNum = "";
                String zyName = "";
                String xkml = "";
                String remarks = "";


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
//                            没用到
                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);

//                        Integer counts = xkzyDictMap.get(convertValue);
//                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);

                        xkzyMap.put(fieldStr, convertValue);

                    }
                    else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
                    {
//                            学科门类、专业类别、备注信息
                        Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);

                        // 只存学科门类
                        if (fieldStr.equals("xkml")) {
                            Integer counts = xkmlDictMap.get(convertValue);
                            xkmlDictMap.put(convertValue, counts == null ? 1 : ++counts);

                            xkml = (String) convertValue;
                        }
                        if (fieldStr.equals("remarks")) {

                            remarks = (String) convertValue;
                        }

                        xkzyMap.put(fieldStr, convertValue);



                    }
                    else {
                        if (fieldStr.equals("zyName")) {
                            xkzyMap.put(fieldStr, value);  // 专业名称

                            zyName = (String) value;
                        }
                        if (fieldStr.equals("deptName")) {
                            xkzyMap.put(fieldStr, value);  // 学院名称

                            // 统计学院下的专业个数
                            xkzyMap.put("zyNum",xyzycollect.get(value).size());


                            deptName = (String) value;
                            zyNum = String.valueOf(xyzycollect.get(value).size());


                        }
                    }
                }

                xkzyMapResult.add(xkzyMap);

                xkzyDetailLists.add(new String[]{deptName,zyNum,zyName+' '+remarks,xkml});
            }

            mapList.add(xkzyDetailLists);




//            {工学=2,}
//            xkmlDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));

//            params.put("GJzyjc_Table",xkzyMapResult);

            params.put("${xyzyNum}",xkzyMapResult.size());
            params.put("${xkmlNum}",xkmlDictMap.size());

            params.put("${xkmlKeys}",xkmlDictMap.keySet().toString());
//            xkzyDictMap.keySet().toString()



//            List<String> xkmlList = Arrays.asList("工学","艺术学","法学","理学","管理学","经济学","文学");
////            if xkmlDictMap.get()
//            xkmlList.forEach(item ->{
//                if (xkmlDictMap.get(item) != null){
//                    params.put("${item}",xkmlDictMap.get(item));
//
////                    params.put(item+"率",((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size())*100 +"%");
//                    params.put("${item+"率"}",new DecimalFormat("#.##%").format((float)xkmlDictMap.get(item) / (float)xkzyMapResult.size()));
//                }
//                else {
//                    params.put(item, 0);
//                    params.put(item + "率", "0%");
//                }
//            });


        }catch (Exception e)
        {
            log.error("导出Word失败{}", e);
        }

        allData.put("params",params);
        allData.put("mapList",mapList);

        return allData;
    }




    /**
     * 得到学院的子节点列表
     * 用于树结构的专业设置表(学院专业表)
     */
    public List<CGjXyzy> getXyzyChildList(List<T> list, CGjXyzy t)
    {
        List<CGjXyzy> tlist = new ArrayList<CGjXyzy>();
        Iterator<T> it = list.iterator();
        while (it.hasNext())
        {
            CGjXyzy n = (CGjXyzy) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getXyzyId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }




//    /**
//     * 写入模板需要的数据到Word
//     * 教师信息 表格
//     */
//    public Map<String, Object> getParamMap3()
//    {
//        Map<String, Object> params = new HashMap<>();
//        params.put("xyzy_num",list.size());
//
//        try {
////            学科门类
//            Map<Object, Integer> xkzyDictMap = new HashMap<>();
//
////            学科专业
//            List<Map<String, Object>> xkzyMapResult = new ArrayList<>();
//            Map<String, Object> xkzyMap;
//
//            for (int index = 0; index < list.size(); index++)
//            {
//
//                xkzyMap = new HashMap<>();
//
//                T vo = (T) list.get(index);
////                int column = 0;
//
//                int ancestorNum = ((CGjXyzy) vo).getAncestors().split(",").length;
////                String daiMa = ((CGjXyzy) vo).getXyzyDaima();
//
//                for (Object[] os : fields)
//                {
//                    Field field = (Field) os[0];
//                    Word word = (Word) os[1];
//
//                    String fieldStr = field.getName();
//
//                    Object value = getTargetValue(vo, field, word);
//                    String dateFormat = word.dateFormat();
//                    String readConverterExp = word.readConverterExp();
//                    String separator = word.separator();
//                    String dictType = word.dictType();
//                    if (StringUtils.isNotEmpty(readConverterExp) && StringUtils.isNotNull(value))
//                    {
//                        Object convertValue = convertByExp(Convert.toStr(value), readConverterExp, separator);
//
////                        Integer counts = xkzyDictMap.get(convertValue);
////                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);
//
//                        xkzyMap.put(fieldStr, convertValue);
//
//                    }
//                    else if (StringUtils.isNotEmpty(dictType) && StringUtils.isNotNull(value))
//                    {
//                        Object convertValue = convertDictByExp(Convert.toStr(value), dictType, separator);
//                        Integer counts = xkzyDictMap.get(convertValue);
//                        xkzyDictMap.put(convertValue, counts == null ? 1 : ++counts);
//
//                        xkzyMap.put(fieldStr, convertValue);
//
//                    }
//
//                    else {
//                        xkzyMap.put(fieldStr, value);
//                    }
//                }
//                xkzyMapResult.add(xkzyMap);
//            }
//
////            {工学=2, 预警=1}
//            xkzyDictMap.entrySet().forEach(e -> params.put(e.getKey().toString(), e.getValue()));
//
//            params.put("GJxyzy_List",xkzyMapResult);
//
//        }catch (Exception e)
//        {
//            log.error("导出Word失败{}", e);
//        }
//
//        return params;
//    }



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
     * 解析字典值
     *
     * @param dictValue 字典值
     * @param dictType 字典类型
     * @param separator 分隔符
     * @return 字典标签
     */
    public static String convertDictByExp(String dictValue, String dictType, String separator)
    {
        return DictUtils.getDictLabel(dictType, dictValue, separator);
    }

    /**
     * 反向解析值字典值
     *
     * @param dictLabel 字典标签
     * @param dictType 字典类型
     * @param separator 分隔符
     * @return 字典值
     */
    public static String reverseDictByExp(String dictLabel, String dictType, String separator)
    {
        return DictUtils.getDictValue(dictType, dictLabel, separator);
    }


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
