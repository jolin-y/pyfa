<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学院代码" prop="xyzyDaima">
        <el-input
          v-model="queryParams.xyzyDaima"
          placeholder="请输入学院代码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学院专业名称" prop="xyzyName">
        <el-input
          v-model="queryParams.xyzyName"
          placeholder="请输入学院专业名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="专业代码" prop="xyzyZydm">
        <el-input
          v-model="queryParams.xyzyZydm"
          placeholder="请输入专业代码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学科门类" prop="xkml">
        <el-select v-model="queryParams.xkml" placeholder="请选择学科门类" clearable size="small">
          <el-option
            v-for="dict in dict.type.c_gj_xkml"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="专业类别" prop="zylb">
        <el-select v-model="queryParams.zylb" placeholder="请选择专业类别" clearable size="small">
          <el-option
            v-for="dict in dict.type.c_gj_zylb"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="备注信息" prop="remarks">
        <el-select v-model="queryParams.remarks" placeholder="请选择备注信息" clearable size="small">
          <el-option
            v-for="dict in dict.type.c_gj_remark"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="专业设置年份" prop="zyCreatYear">
        <el-input
          v-model="queryParams.zyCreatYear"
          placeholder="请输入专业设置年份"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="毕业年份(届)" prop="byYear">
        <el-input
          v-model="queryParams.byYear"
          placeholder="请输入毕业年份(届)"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
	    <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

<!--    <el-row :gutter="10" class="mb8">-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['drdc:zyjc:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
<!--    </el-row>-->

    <el-table
      v-loading="loading"
      :data="zyjcList"
      row-key="xyzyId"
      default-expand-all
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="学院专业名称" prop="xyzyName" width="200" />
      <el-table-column label="学院简称" align="center" prop="xyzyShortName" />
      <el-table-column label="学院代码" align="center" prop="xyzyDaima" />
      <el-table-column label="专业代码" align="center" prop="xyzyZydm" />
      <el-table-column label="学科门类" align="center" prop="xkml">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.c_gj_xkml" :value="scope.row.xkml"/>
        </template>
      </el-table-column>
      <el-table-column label="专业类别" align="center" prop="zylb">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.c_gj_zylb" :value="scope.row.zylb"/>
        </template>
      </el-table-column>
      <el-table-column label="备注信息" align="center" prop="remarks">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.c_gj_remark" :value="scope.row.remarks"/>
        </template>
      </el-table-column>
      <el-table-column label="专业设置年份" align="center" prop="zyCreatYear" />
      <el-table-column label="教师数量" align="center" prop="teacherNum" />
      <el-table-column label="高级职称数量" align="center" prop="gjzcNum" />
      <el-table-column label="学生数量" align="center" prop="studentNum" />
      <el-table-column label="招生情况id" align="center" prop="zsqkId" />
      <el-table-column label="招生计划数" align="center" prop="zsjhNum" />
      <el-table-column label="实际录取数" align="center" prop="sjlqNum" />
      <el-table-column label="分班情况" align="center" prop="fbqk" />
      <el-table-column label="第一志愿录取数" align="center" prop="dyzylqNum" />
      <el-table-column label="实际报到数" align="center" prop="sjbdNum" />
      <el-table-column label="毕业率" align="center" prop="byl" />
      <el-table-column label="学位授予率" align="center" prop="xwsyl" />
      <el-table-column label="毕业生数" align="center" prop="bysNum" />
      <el-table-column label="初次就业率" align="center" prop="ccjyl" />
      <el-table-column label="过程就业率" align="center" prop="gcjyl" />
      <el-table-column label="毕业年份(届)" align="center" prop="byYear" />
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="150px">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['drdc:zyjc:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-plus"-->
<!--            @click="handleAdd(scope.row)"-->
<!--            v-hasPermi="['drdc:zyjc:add']"-->
<!--          >新增</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['drdc:zyjc:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <!-- 添加或修改专业监测对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="学院专业id(序号)" prop="xyzyId">-->
<!--          <el-input v-model="form.xyzyId" placeholder="请输入学院专业id(序号)" />-->
<!--        </el-form-item>-->
        <el-form-item label="上级学院专业" prop="parentId">
          <treeselect v-model="form.parentId" :options="zyjcOptions" :normalizer="normalizer" placeholder="请选择上级学院专业" />
        </el-form-item>
        <el-form-item label="学院代码" prop="xyzyDaima">
          <el-input v-model="form.xyzyDaima" placeholder="请输入学院代码" />
        </el-form-item>
        <el-form-item label="学院专业名称" prop="xyzyName">
          <el-input v-model="form.xyzyName" placeholder="请输入学院专业名称" />
        </el-form-item>
        <el-form-item label="学院简称" prop="xyzyShortName">
          <el-input v-model="form.xyzyShortName" placeholder="请输入学院简称" />
        </el-form-item>
        <el-form-item label="专业代码" prop="xyzyZydm">
          <el-input v-model="form.xyzyZydm" placeholder="请输入专业代码" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />
        </el-form-item>
        <el-form-item label="学科门类" prop="xkml">
          <el-select v-model="form.xkml" placeholder="请选择学科门类">
            <el-option
              v-for="dict in dict.type.c_gj_xkml"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="专业类别" prop="zylb">
          <el-select v-model="form.zylb" placeholder="请选择专业类别">
            <el-option
              v-for="dict in dict.type.c_gj_zylb"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注信息" prop="remarks">
          <el-select v-model="form.remarks" placeholder="请选择备注信息">
            <el-option
              v-for="dict in dict.type.c_gj_remark"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="专业设置年份" prop="zyCreatYear">
          <el-input v-model="form.zyCreatYear" placeholder="请输入专业设置年份" />
        </el-form-item>
<!--        <el-form-item label="专任教师与学生id" prop="zrjsyxsId">-->
<!--          <el-input v-model="form.zrjsyxsId" placeholder="请输入专任教师与学生id" />-->
<!--        </el-form-item>-->
        <el-form-item label="教师数量" prop="teacherNum">
          <el-input v-model="form.teacherNum" placeholder="请输入教师数量" />
        </el-form-item>
        <el-form-item label="高级职称数量" prop="gjzcNum">
          <el-input v-model="form.gjzcNum" placeholder="请输入高级职称数量" />
        </el-form-item>
        <el-form-item label="学生数量" prop="studentNum">
          <el-input v-model="form.studentNum" placeholder="请输入学生数量" />
        </el-form-item>
<!--        <el-form-item label="招生情况id" prop="zsqkId">-->
<!--          <el-input v-model="form.zsqkId" placeholder="请输入招生情况id" />-->
<!--        </el-form-item>-->
        <el-form-item label="招生计划数" prop="zsjhNum">
          <el-input v-model="form.zsjhNum" placeholder="请输入招生计划数" />
        </el-form-item>
        <el-form-item label="实际录取数" prop="sjlqNum">
          <el-input v-model="form.sjlqNum" placeholder="请输入实际录取数" />
        </el-form-item>
        <el-form-item label="分班情况" prop="fbqk">
          <el-input v-model="form.fbqk" placeholder="请输入分班情况" />
        </el-form-item>
        <el-form-item label="第一志愿录取数" prop="dyzylqNum">
          <el-input v-model="form.dyzylqNum" placeholder="请输入第一志愿录取数" />
        </el-form-item>
        <el-form-item label="实际报到数" prop="sjbdNum">
          <el-input v-model="form.sjbdNum" placeholder="请输入实际报到数" />
        </el-form-item>
<!--        <el-form-item label="毕业与就业id" prop="byyjyId">-->
<!--          <el-input v-model="form.byyjyId" placeholder="请输入毕业与就业id" />-->
<!--        </el-form-item>-->
        <el-form-item label="毕业率" prop="byl">
          <el-input v-model="form.byl" placeholder="请输入毕业率" />
        </el-form-item>
        <el-form-item label="学位授予率" prop="xwsyl">
          <el-input v-model="form.xwsyl" placeholder="请输入学位授予率" />
        </el-form-item>
        <el-form-item label="毕业生数" prop="bysNum">
          <el-input v-model="form.bysNum" placeholder="请输入毕业生数" />
        </el-form-item>
        <el-form-item label="初次就业率" prop="ccjyl">
          <el-input v-model="form.ccjyl" placeholder="请输入初次就业率" />
        </el-form-item>
        <el-form-item label="过程就业率" prop="gcjyl">
          <el-input v-model="form.gcjyl" placeholder="请输入过程就业率" />
        </el-form-item>
        <el-form-item label="毕业年份(届)" prop="byYear">
          <el-input v-model="form.byYear" placeholder="请输入毕业年份(届)" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listZyjc, getZyjc, delZyjc, addZyjc, updateZyjc, exportZyjc } from "@/api/drdc/zyjc";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Zyjc",
  dicts: ['c_gj_xkml', 'c_gj_zylb', 'c_gj_remark'],
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 专业监测表格数据
      zyjcList: [],
      // 专业监测树选项
      zyjcOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        xyzyDaima: null,
        xyzyName: null,
        xyzyZydm: null,
        xkml: null,
        zylb: null,
        remarks: null,
        zyCreatYear: null,
        byYear: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        // xyzyId: [
        //   { required: true, message: "学院专业id(序号)不能为空", trigger: "blur" }
        // ],
        // zrjsyxsId: [
        //   { required: true, message: "专任教师与学生id不能为空", trigger: "blur" }
        // ],
        // zsqkId: [
        //   { required: true, message: "招生情况id不能为空", trigger: "blur" }
        // ],
        // byyjyId: [
        //   { required: true, message: "毕业与就业id不能为空", trigger: "blur" }
        // ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询专业监测列表 */
    getList() {
      this.loading = true;
      listZyjc(this.queryParams).then(response => {
        this.zyjcList = this.handleTree(response.data, "xyzyId", "parentId");
        this.loading = false;
      });
    },
    /** 转换专业监测数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.xyzyId,
        label: node.xyzyName,
        children: node.children
      };
    },
	/** 查询专业监测下拉树结构 */
    getTreeselect() {
      listZyjc().then(response => {
        this.zyjcOptions = [];
        const data = { xyzyId: 0, xyzyName: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "xyzyId", "parentId");
        this.zyjcOptions.push(data);
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        xyzyId: null,
        parentId: null,
        ancestors: null,
        xyzyDaima: null,
        xyzyName: null,
        xyzyShortName: null,
        xyzyZydm: null,
        orderNum: null,
        xkml: null,
        zylb: null,
        remarks: null,
        zyCreatYear: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        zrjsyxsId: null,
        teacherNum: null,
        gjzcNum: null,
        studentNum: null,
        zsqkId: null,
        zsjhNum: null,
        sjlqNum: null,
        fbqk: null,
        dyzylqNum: null,
        sjbdNum: null,
        byyjyId: null,
        byl: null,
        xwsyl: null,
        bysNum: null,
        ccjyl: null,
        gcjyl: null,
        byYear: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.xyzyId) {
        this.form.parentId = row.xyzyId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加专业监测";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.xyzyId;
      }
      getZyjc(row.xyzyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改专业监测";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.xyzyId != null) {
            updateZyjc(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addZyjc(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$modal.confirm('是否确认删除专业监测编号为"' + row.xyzyId + '"的数据项？').then(function() {
        return delZyjc(row.xyzyId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
