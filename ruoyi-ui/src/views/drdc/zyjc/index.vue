<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="专业名称" prop="zyName">
        <el-input
          v-model="queryParams.zyName"
          placeholder="请输入专业名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门名称" prop="deptName">
        <el-input
          v-model="queryParams.deptName"
          placeholder="请输入部门名称"
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
      <el-form-item label="毕业年份" prop="byYear">
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['drdc:zyjc:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['drdc:zyjc:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['drdc:zyjc:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['drdc:zyjc:export']"
        >导出Excel</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportWordLoading"
          @click="handleExportWord"
          v-hasPermi="['drdc:zyjc:export']"
        >导出word</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="zyjcList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="部门名称" align="center" prop="deptName" width="100px"/>
      <el-table-column label="专业名称" align="center" prop="zyName" width="100px"/>
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

<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
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
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['drdc:zyjc:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->

    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改专业监测对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
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
import { listZyjc, getZyjc, delZyjc, addZyjc, updateZyjc, exportZyjc, exportZyjcInfoWord } from "@/api/drdc/zyjc";

export default {
  name: "Zyjc",
  dicts: ['c_gj_xkml', 'c_gj_zylb', 'c_gj_remark'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      exportWordLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 专业监测表格数据
      zyjcList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        zyName: null,
        deptName: null,
        xkml: null,
        zylb: null,
        remarks: null,
        byYear: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
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
        this.zyjcList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        zyId: null,
        deptId: null,
        zyName: null,
        deptName: null,
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
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.zyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加专业监测";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const zyId = row.zyId || this.ids
      getZyjc(zyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改专业监测";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.zyId != null) {
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
      const zyIds = row.zyId || this.ids;
      this.$modal.confirm('是否确认删除专业监测编号为"' + zyIds + '"的数据项？').then(function() {
        return delZyjc(zyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有专业监测数据项？').then(() => {
        this.exportLoading = true;
        return exportZyjc(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    },


    /** 导出word按钮操作 */
    handleExportWord() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出教师信息word？').then(() => {
        this.exportWordLoading = true;
        return exportZyjcInfoWord(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportWordLoading = false;
      }).catch(() => {});
    },

  }
};
</script>
