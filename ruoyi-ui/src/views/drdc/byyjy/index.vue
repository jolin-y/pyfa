<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学院专业id" prop="xyzyId">
        <el-input
          v-model="queryParams.xyzyId"
          placeholder="请输入学院专业id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="毕业率" prop="byl">-->
<!--        <el-input-->
<!--          v-model="queryParams.byl"-->
<!--          placeholder="请输入毕业率"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="学位授予率" prop="xwsyl">-->
<!--        <el-input-->
<!--          v-model="queryParams.xwsyl"-->
<!--          placeholder="请输入学位授予率"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="毕业生数" prop="bysNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.bysNum"-->
<!--          placeholder="请输入毕业生数"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="初次就业率" prop="ccjyl">-->
<!--        <el-input-->
<!--          v-model="queryParams.ccjyl"-->
<!--          placeholder="请输入初次就业率"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="过程就业率" prop="gcjyl">-->
<!--        <el-input-->
<!--          v-model="queryParams.gcjyl"-->
<!--          placeholder="请输入过程就业率"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['drdc:byyjy:add']"
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
          v-hasPermi="['drdc:byyjy:edit']"
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
          v-hasPermi="['drdc:byyjy:remove']"
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
          v-hasPermi="['drdc:byyjy:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="byyjyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="毕业与就业id" align="center" prop="byyjyId" />-->
      <el-table-column label="学院专业id" align="center" prop="xyzyId" />
      <el-table-column label="毕业率" align="center" prop="byl" />
      <el-table-column label="学位授予率" align="center" prop="xwsyl" />
      <el-table-column label="毕业生数" align="center" prop="bysNum" />
      <el-table-column label="初次就业率" align="center" prop="ccjyl" />
      <el-table-column label="过程就业率" align="center" prop="gcjyl" />
      <el-table-column label="毕业年份(届)" align="center" prop="byYear" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drdc:byyjy:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drdc:byyjy:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改高教-毕业与就业对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学院专业id" prop="xyzyId">
          <el-input v-model="form.xyzyId" placeholder="请输入学院专业id" />
        </el-form-item>
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
import { listByyjy, getByyjy, delByyjy, addByyjy, updateByyjy, exportByyjy } from "@/api/drdc/byyjy";

export default {
  name: "Byyjy",
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
      // 高教-毕业与就业表格数据
      byyjyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        xyzyId: null,
        byl: null,
        xwsyl: null,
        bysNum: null,
        ccjyl: null,
        gcjyl: null,
        byYear: null,
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
    /** 查询高教-毕业与就业列表 */
    getList() {
      this.loading = true;
      listByyjy(this.queryParams).then(response => {
        this.byyjyList = response.rows;
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
        byyjyId: null,
        xyzyId: null,
        byl: null,
        xwsyl: null,
        bysNum: null,
        ccjyl: null,
        gcjyl: null,
        byYear: null,
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
      this.ids = selection.map(item => item.byyjyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加高教-毕业与就业";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const byyjyId = row.byyjyId || this.ids
      getByyjy(byyjyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改高教-毕业与就业";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.byyjyId != null) {
            updateByyjy(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addByyjy(this.form).then(response => {
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
      const byyjyIds = row.byyjyId || this.ids;
      this.$modal.confirm('是否确认删除高教-毕业与就业编号为"' + byyjyIds + '"的数据项？').then(function() {
        return delByyjy(byyjyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有高教-毕业与就业数据项？').then(() => {
        this.exportLoading = true;
        return exportByyjy(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    },
  }
};
</script>
