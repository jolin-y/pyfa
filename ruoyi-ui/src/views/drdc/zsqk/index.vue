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
<!--      <el-form-item label="招生计划数" prop="zsjhNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.zsjhNum"-->
<!--          placeholder="请输入招生计划数"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="实际录取数" prop="sjlqNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.sjlqNum"-->
<!--          placeholder="请输入实际录取数"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="分班情况" prop="fbqk">-->
<!--        <el-input-->
<!--          v-model="queryParams.fbqk"-->
<!--          placeholder="请输入分班情况"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="第一志愿录取数" prop="dyzylqNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.dyzylqNum"-->
<!--          placeholder="请输入第一志愿录取数"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="实际报到数" prop="sjbdNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.sjbdNum"-->
<!--          placeholder="请输入实际报到数"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
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
          v-hasPermi="['drdc:zsqk:add']"
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
          v-hasPermi="['drdc:zsqk:edit']"
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
          v-hasPermi="['drdc:zsqk:remove']"
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
          v-hasPermi="['drdc:zsqk:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="zsqkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="招生情况id" align="center" prop="zsqkId" />-->
      <el-table-column label="学院专业id" align="center" prop="xyzyId" />
      <el-table-column label="招生计划数" align="center" prop="zsjhNum" />
      <el-table-column label="实际录取数" align="center" prop="sjlqNum" />
      <el-table-column label="分班情况" align="center" prop="fbqk" />
      <el-table-column label="第一志愿录取数" align="center" prop="dyzylqNum" />
      <el-table-column label="实际报到数" align="center" prop="sjbdNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drdc:zsqk:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drdc:zsqk:remove']"
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

    <!-- 添加或修改高教-招生情况对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学院专业id" prop="xyzyId">
          <el-input v-model="form.xyzyId" placeholder="请输入学院专业id" />
        </el-form-item>
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
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listZsqk, getZsqk, delZsqk, addZsqk, updateZsqk, exportZsqk } from "@/api/drdc/zsqk";

export default {
  name: "Zsqk",
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
      // 高教-招生情况表格数据
      zsqkList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        xyzyId: null,
        zsjhNum: null,
        sjlqNum: null,
        fbqk: null,
        dyzylqNum: null,
        sjbdNum: null,
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
    /** 查询高教-招生情况列表 */
    getList() {
      this.loading = true;
      listZsqk(this.queryParams).then(response => {
        this.zsqkList = response.rows;
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
        zsqkId: null,
        xyzyId: null,
        zsjhNum: null,
        sjlqNum: null,
        fbqk: null,
        dyzylqNum: null,
        sjbdNum: null,
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
      this.ids = selection.map(item => item.zsqkId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加高教-招生情况";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const zsqkId = row.zsqkId || this.ids
      getZsqk(zsqkId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改高教-招生情况";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.zsqkId != null) {
            updateZsqk(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addZsqk(this.form).then(response => {
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
      const zsqkIds = row.zsqkId || this.ids;
      this.$modal.confirm('是否确认删除高教-招生情况编号为"' + zsqkIds + '"的数据项？').then(function() {
        return delZsqk(zsqkIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有高教-招生情况数据项？').then(() => {
        this.exportLoading = true;
        return exportZsqk(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
