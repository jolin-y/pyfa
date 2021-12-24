<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--专业数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="xyzyName"
            placeholder="请输入专业名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="xyzyOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            default-expand-all
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>

      <!--专任教师数据-->
      <el-col :span="20" :xs="24">





<!--    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">-->
<!--      <el-form-item label="学院专业id" prop="xyzyId">-->
<!--        <el-input-->
<!--          v-model="queryParams.xyzyId"-->
<!--          placeholder="请输入学院专业id"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

<!--      <el-form-item label="教师数量" prop="teacherNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.teacherNum"-->
<!--          placeholder="请输入教师数量"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="高级职称数量" prop="gjzcNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.gjzcNum"-->
<!--          placeholder="请输入高级职称数量"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="学生数量" prop="studentNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.studentNum"-->
<!--          placeholder="请输入学生数量"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['drdc:zrjsyxs:add']"
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
          v-hasPermi="['drdc:zrjsyxs:edit']"
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
          v-hasPermi="['drdc:zrjsyxs:remove']"
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
          v-hasPermi="['drdc:zrjsyxs:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="zrjsyxsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="专任教师与学生id" align="center" prop="zrjsyxsId" />-->
<!--      <el-table-column label="学院专业id" align="center" prop="xyzyId" />-->

      <el-table-column label="学院专业名称" align="center" prop="xyzy.xyzyName"/>

      <el-table-column label="教师数量" align="center" prop="teacherNum" />
      <el-table-column label="高级职称数量" align="center" prop="gjzcNum" />
      <el-table-column label="学生数量" align="center" prop="studentNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drdc:zrjsyxs:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drdc:zrjsyxs:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

      </el-col>
    </el-row>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改高教-专任教师与学生对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="学院专业id" prop="xyzyId">-->
<!--          <el-input v-model="form.xyzyId" placeholder="请输入学院专业id" />-->
<!--        </el-form-item>-->

        <el-form-item label="归属专业" prop="deptId">
          <treeselect v-model="form.xyzyId" :options="xyzyOptions" :show-count="true" placeholder="请选择归属专业" />
        </el-form-item>


        <el-form-item label="教师数量" prop="teacherNum">
          <el-input v-model="form.teacherNum" placeholder="请输入教师数量" />
        </el-form-item>
        <el-form-item label="高级职称数量" prop="gjzcNum">
          <el-input v-model="form.gjzcNum" placeholder="请输入高级职称数量" />
        </el-form-item>
        <el-form-item label="学生数量" prop="studentNum">
          <el-input v-model="form.studentNum" placeholder="请输入学生数量" />
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
import { listZrjsyxs, getZrjsyxs, delZrjsyxs, addZrjsyxs, updateZrjsyxs, exportZrjsyxs } from "@/api/drdc/zrjsyxs";

import { xyzyTreeselect } from "@/api/drdc/xyzy";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Zrjsyxs",
  components: { Treeselect },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
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
      // 高教-专任教师与学生表格数据
      zrjsyxsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,

      // 学院专业树选项
      xyzyOptions: [],
      // 学院专业名称
      xyzyName: undefined,

      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        xyzyId: null,
        teacherNum: null,
        gjzcNum: null,
        studentNum: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 表单校验
      rules: {
      }
    };
  },

  watch: {
    // 根据名称筛选部门树
    xyzyName(val) {
      this.$refs.tree.filter(val);
    }
  },

  created() {
    this.getList();
    this.getTreeselect();
  },
  methods: {
    /** 查询高教-专任教师与学生列表 */
    getList() {
      this.loading = true;
      listZrjsyxs(this.queryParams).then(response => {
        this.zrjsyxsList = response.rows;
        this.total = response.total;
        this.loading = false;
        // console.log(this.zrjsyxsList)
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
        zrjsyxsId: null,
        xyzyId: null,
        teacherNum: null,
        gjzcNum: null,
        studentNum: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.ids = selection.map(item => item.zrjsyxsId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.getTreeselect();
      this.open = true;
      this.title = "添加高教-专任教师与学生";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      const zrjsyxsId = row.zrjsyxsId || this.ids
      getZrjsyxs(zrjsyxsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改高教-专任教师与学生";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.zrjsyxsId != null) {
            updateZrjsyxs(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addZrjsyxs(this.form).then(response => {
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
      const zrjsyxsIds = row.zrjsyxsId || this.ids;
      this.$modal.confirm('是否确认删除高教-专任教师与学生编号为"' + zrjsyxsIds + '"的数据项？').then(function() {
        return delZrjsyxs(zrjsyxsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有高教-专任教师与学生数据项？').then(() => {
        this.exportLoading = true;
        return exportZrjsyxs(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    },


    /** 查询部门下拉树结构 */
    getTreeselect() {
      xyzyTreeselect().then(response => {
        this.xyzyOptions = response.data;
      });
    },

    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.xyzyId = data.id;
      this.getList();
    },

  }
};
</script>
