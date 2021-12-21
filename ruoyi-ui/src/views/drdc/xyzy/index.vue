<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="父学院专业id" prop="parentId">-->
<!--        <el-input-->
<!--          v-model="queryParams.parentId"-->
<!--          placeholder="请输入父学院专业id"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="祖级列表" prop="ancestors">-->
<!--        <el-input-->
<!--          v-model="queryParams.ancestors"-->
<!--          placeholder="请输入祖级列表"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
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
      <el-form-item label="学院简称" prop="xyzyShortName">
        <el-input
          v-model="queryParams.xyzyShortName"
          placeholder="请输入学院简称"
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
<!--      <el-form-item label="年份" prop="year">-->
<!--        <el-input-->
<!--          v-model="queryParams.year"-->
<!--          placeholder="请输入年份"-->
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
          v-hasPermi="['drdc:xyzy:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportWordLoading"
          @click="handleExportWord"
          v-hasPermi="['drdc:teacherInfo:export']"
        >导出word</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="xyzyList"
      row-key="xyzyId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
<!--      <el-table-column label="父学院专业id" prop="parentId" />-->
<!--      <el-table-column label="祖级列表" align="center" prop="ancestors" />-->
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
<!--      <el-table-column label="年份" align="center" prop="year" />-->

<!--      <el-table-column label="显示顺序" align="center" prop="orderNum" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drdc:xyzy:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['drdc:xyzy:add']"
          >新增</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drdc:xyzy:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>




    <!-- 添加或修改学院专业对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="父学院专业id" prop="parentId">-->
        <el-form-item label="上级学院专业" prop="parentId">
          <treeselect v-model="form.parentId" :options="xyzyOptions" :normalizer="normalizer" placeholder="请选择父学院专业id" />
        </el-form-item>
        <el-form-item label="学院专业名称" prop="xyzyName">
          <el-input v-model="form.xyzyName" placeholder="请输入学院专业名称" />
        </el-form-item>
        <el-form-item label="学院简称" prop="xyzyShortName">
          <el-input v-model="form.xyzyShortName" placeholder="请输入学院简称" />
        </el-form-item>
        <el-form-item label="学院代码" prop="xyzyDaima">
          <el-input v-model="form.xyzyDaima" placeholder="请输入学院代码" />
        </el-form-item>
        <el-form-item label="专业代码" prop="xyzyZydm">
          <el-input v-model="form.xyzyZydm" placeholder="请输入专业代码" />
        </el-form-item>

<!--        <el-form-item label="显示顺序" prop="orderNum">-->
<!--          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />-->
<!--        </el-form-item>-->

        <el-form-item label="显示顺序" prop="orderNum">
          <el-input-number v-model="form.orderNum" controls-position="right" :min="0" />
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
          <el-select v-model="form.zylb" placeholder="请选择专业类别" clearable>
            <el-option
              v-for="dict in dict.type.c_gj_zylb"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="备注信息" prop="remarks">
          <el-select v-model="form.remarks" placeholder="请选择备注信息" clearable>
            <el-option
              v-for="dict in dict.type.c_gj_remark"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>

<!--        <el-form-item label="备注信息">-->
<!--          <el-checkbox-group v-model="form.remarks">-->
<!--            <el-checkbox-->
<!--              v-for="dict in dict.type.c_gj_remark"-->
<!--              :key="dict.value"-->
<!--              :label="dict.value">-->
<!--              {{dict.label}}-->
<!--            </el-checkbox>-->
<!--          </el-checkbox-group>-->
<!--        </el-form-item>-->

<!--        <el-form-item label="年份" prop="year" v-if="form.parentId === 0">-->
<!--          <el-input v-model="form.year" placeholder="请输入年份" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listXyzy, getXyzy, delXyzy, addXyzy, updateXyzy, exportXyzy, exportXyzyWord } from "@/api/drdc/xyzy";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Xyzy",
  dicts: ['c_gj_xkml', 'c_gj_zylb', 'c_gj_remark'],
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportWordLoading: false,
      // 显示搜索条件
      showSearch: true,
      // 学院专业表格数据
      xyzyList: [],
      // 学院专业树选项
      xyzyOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        // parentId: null,
        // ancestors: null,
        xyzyDaima: null,
        xyzyName: null,
        xyzyShortName: null,
        xyzyZydm: null,
        xkml: null,
        zylb: null,
        remarks: null,
        // year: null,
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
    /** 查询学院专业列表 */
    getList() {
      this.loading = true;
      listXyzy(this.queryParams).then(response => {
        this.xyzyList = this.handleTree(response.data, "xyzyId", "parentId");
        this.loading = false;
      });
    },
    /** 转换学院专业数据结构 */
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
	/** 查询学院专业下拉树结构 */
    getTreeselect() {
      listXyzy().then(response => {
        this.xyzyOptions = [];
        const data = { xyzyId: 0, xyzyName: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "xyzyId", "parentId");
        this.xyzyOptions.push(data);
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
        year: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.title = "添加学院专业";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.xyzyId;
      }
      getXyzy(row.xyzyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改学院专业";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.xyzyId != null) {
            updateXyzy(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addXyzy(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除学院专业编号为"' + row.xyzyId + '"的数据项？').then(function() {
        return delXyzy(row.xyzyId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },

    /** 导出word按钮操作 */
    handleExportWord() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出教师信息word？').then(() => {
        this.exportWordLoading = true;
        return exportXyzyWord(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportWordLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
