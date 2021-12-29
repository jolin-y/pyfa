<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="学院名称" prop="deptName">-->
<!--        <el-input-->
<!--          v-model="deptName"-->
<!--          placeholder="请输入专业名称"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

      <el-form-item label="所属学院" prop="deptId">
        <treeselect v-model="queryParams.deptId" :options="deptOptions" :show-count="true" placeholder="请选择所属学院" style="width: 205px;line-height: 30px;"/>
      </el-form-item>


      <el-form-item label="专业名称" prop="zyName">
        <el-input
          v-model="queryParams.zyName"
          placeholder="请输入专业名称"
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
<!--      <el-form-item label="专业设置年份" prop="zyCreatYear">-->
<!--        <el-input-->
<!--          v-model="queryParams.zyCreatYear"-->
<!--          placeholder="请输入专业设置年份"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
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
          v-hasPermi="['drdc:zysz:add']"
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
          v-hasPermi="['drdc:zysz:edit']"
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
          v-hasPermi="['drdc:zysz:remove']"
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
          v-hasPermi="['drdc:zysz:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="zyszList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="专业id(序号)" align="center" prop="zyId" />-->
<!--      <el-table-column label="部门id" align="center" prop="deptId" />-->
      <el-table-column label="学院" align="center" key="deptName" prop="dept.deptName"/>
      <el-table-column label="专业名称" align="center" prop="zyName" />
      <el-table-column label="专业代码" align="center" prop="xyzyZydm" />
      <el-table-column label="专业设置年份" align="center" prop="zyCreatYear" />
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drdc:zysz:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drdc:zysz:remove']"
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

    <!-- 添加或修改专业设置2对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="部门id" prop="deptId">-->
<!--          <el-input v-model="form.deptId" placeholder="请输入部门id" />-->
<!--        </el-form-item>-->
        <el-form-item label="所属学院" prop="deptId">
          <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择所属学院" />
        </el-form-item>

        <el-form-item label="专业名称" prop="zyName">
          <el-input v-model="form.zyName" placeholder="请输入专业名称" />
        </el-form-item>
        <el-form-item label="专业代码" prop="xyzyZydm">
          <el-input v-model="form.xyzyZydm" placeholder="请输入专业代码" />
        </el-form-item>
        <el-form-item label="专业设置年份" prop="zyCreatYear">
          <el-input v-model="form.zyCreatYear" placeholder="请输入专业设置年份" />
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
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />
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
import { listZysz, getZysz, delZysz, addZysz, updateZysz, exportZysz } from "@/api/drdc/zysz";
import { treeselect2layer } from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Zysz",
  dicts: ['c_gj_xkml', 'c_gj_zylb', 'c_gj_remark'],
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
      // 专业设置2表格数据
      zyszList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 部门树选项
      deptOptions: [],
      // 部门名称
      deptName: undefined,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        zyName: null,
        xyzyZydm: null,
        zyCreatYear: null,
        xkml: null,
        zylb: null,
        remarks: null,
        // deptName: null,
        deptId: null,
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
    this.getTreeselect();
  },
  methods: {
    /** 查询专业设置2列表 */
    getList() {
      this.loading = true;
      listZysz(this.queryParams).then(response => {
        this.zyszList = response.rows;
        this.total = response.total;
        this.loading = false;

        // console.log(this.zyszList)
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
        xyzyZydm: null,
        zyCreatYear: null,
        xkml: null,
        zylb: null,
        remarks: null,
        orderNum: null,
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
      this.ids = selection.map(item => item.zyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.getTreeselect();
      this.open = true;
      this.title = "添加专业设置2";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      const zyId = row.zyId || this.ids
      getZysz(zyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改专业设置2";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.zyId != null) {
            updateZysz(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addZysz(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除专业设置2编号为"' + zyIds + '"的数据项？').then(function() {
        return delZysz(zyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有专业设置2数据项？').then(() => {
        this.exportLoading = true;
        return exportZysz(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    },

    /** 查询部门下拉树结构 */
    getTreeselect() {
      treeselect2layer().then(response => {
        this.deptOptions = response.data;
        // console.log(this.deptOptions)
      });
    },
  }
};
</script>

<style>
  .vue-treeselect >>> .vue-treeselect__control {
    height: 32px;
  }
</style>
