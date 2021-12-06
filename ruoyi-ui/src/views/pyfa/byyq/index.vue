<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="100px">
<!--      <el-form-item label="方案版本" prop="pyfaId">-->
<!--&lt;!&ndash;      <el-form-item label="方案版本">&ndash;&gt;-->
<!--        <el-select v-model="queryParams.pyfaId" placeholder="培养方案版本" size="small">-->
<!--          <el-option-->
<!--            v-for="dict in dict.type.xpu_pyfa_version"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          ></el-option>-->
<!--        </el-select>-->
<!--      </el-form-item>-->


      <el-form-item label="毕业要求名称" prop="byyqName">
        <el-input
          v-model="queryParams.byyqName"
          placeholder="请输入毕业要求名称"
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
          v-hasPermi="['pyfa:byyq:add']"
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="byyqList"
      row-key="byyqId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
<!--      default-expand-all-->

<!--      <el-table-column label="父要求id" prop="parentId" />-->
<!--      <el-table-column label="祖级列表" align="center" prop="ancestors" />-->

      <el-table-column label="毕业要求名称" prop="byyqName" width="200" />
      <el-table-column label="排序" align="center" prop="orderNum" width="150" />
      <el-table-column label="毕业要求内容" align="center" prop="byyqContent" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['pyfa:byyq:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['pyfa:byyq:add']"
          >新增</el-button>
          <el-button
            v-if="scope.row.parentId != 0"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['pyfa:byyq:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改毕业要求对话框 -->
<!--    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>-->
<!--      <el-form ref="form" :model="form" :rules="rules" label-width="80px">-->
<!--        <el-form-item label="上级要求id" prop="parentId">-->
<!--          <treeselect v-model="form.parentId" :options="byyqOptions" :normalizer="normalizer" placeholder="请选择上级毕业要求id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="毕业要求名称" prop="byyqName">-->
<!--          <el-input v-model="form.byyqName" placeholder="请输入毕业要求名称" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="毕业要求内容">-->
<!--          <editor v-model="form.byyqContent" :min-height="192"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="显示顺序" prop="orderNum">-->
<!--          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="删除标志" prop="delFlag">-->
<!--          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--      <div slot="footer" class="dialog-footer">-->
<!--        <el-button type="primary" @click="submitForm">确 定</el-button>-->
<!--        <el-button @click="cancel">取 消</el-button>-->
<!--      </div>-->
<!--    </el-dialog>-->




    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="24" v-if="form.parentId !== 0">
            <el-form-item label="上级要求" prop="parentId">
              <treeselect v-model="form.parentId" :options="byyqOptions" :normalizer="normalizer" placeholder="请选择上级毕业要求" />
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="要求名称" prop="byyqName">
              <el-input v-model="form.byyqName" placeholder="请输入毕业要求名称" />
            </el-form-item>
          </el-col>

          <el-col :span="12">
            <el-form-item label="显示排序" prop="orderNum">
              <el-input-number v-model="form.orderNum" controls-position="right" :min="0" />
            </el-form-item>
          </el-col>

<!--          <el-col :span="12" v-if="form.parentId === 0">-->
<!--            <el-form-item label="方案版本">-->
<!--              <el-select v-model="form.pyfaId" placeholder="请选择">-->
<!--                <el-option-->
<!--                  v-for="dict in dict.type.xpu_pyfa_version"-->
<!--                  :key="dict.value"-->
<!--                  :label="dict.label"-->
<!--                  :value="dict.value"-->
<!--                ></el-option>-->
<!--              </el-select>-->
<!--            </el-form-item>-->
<!--          </el-col>-->

          <el-col :span="24" v-if="form.parentId !== 0">
<!--            <el-form-item label="负责人" prop="leader">-->
<!--              <el-input v-model="form.leader" placeholder="请输入负责人" maxlength="20" />-->
<!--            </el-form-item>-->

            <el-form-item label="要求内容" prop="byyqContent">
              <el-input v-model="form.byyqContent" type="textarea" placeholder="请输入毕业要求内容" :autosize="{minRows: 5, maxRows: undefined}" />
            </el-form-item>

          </el-col>

        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listByyq, getByyq, delByyq, addByyq, updateByyq, listByyqExcludeChild, exportByyq } from "@/api/pyfa/byyq/byyq";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Byyq",
  dicts: ['xpu_pyfa_version'],
  components: { Treeselect  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 毕业要求表格数据
      byyqList: [],
      // 毕业要求树选项
      byyqOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 是否展开
      expand: false,
      // 查询参数
      queryParams: {
        byyqName: undefined,
        pyfaId: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: "上级要求不能为空", trigger: "blur" }
        ],
        byyqName: [
          { required: true, message: "要求名称不能为空", trigger: "blur" }
        ],
        orderNum: [
          { required: true, message: "显示排序不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询毕业要求列表 */
    getList() {
      this.loading = true;
      listByyq(this.queryParams).then(response => {
        this.byyqList = this.handleTree(response.data, "byyqId", "parentId");
        // console.log(response.data);
        this.loading = false;
      });
    },
    /** 转换毕业要求数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.byyqId,
        label: node.byyqName,
        children: node.children
      };
    },
	/** 查询毕业要求下拉树结构 */
    getTreeselect() {
      listByyq().then(response => {
        this.byyqOptions = [];
        const data = { byyqId: 0, byyqName: '顶级节点', children: [] };

        data.children = this.handleTree(response.data, "byyqId", "parentId");

        this.byyqOptions.push(data);

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
        byyqId: undefined,
        parentId: undefined,
        // ancestors: null,
        byyqName: undefined,
        byyqContent: undefined,
        orderNum: undefined,
        // delFlag: null,
        // createBy: null,
        // createTime: null,
        // updateBy: null,
        // updateTime: null

        pyfaId: undefined,
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
      if (row != undefined) {
        this.form.parentId = row.byyqId;
        this.form.pyfaId = row.pyfaId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加毕业要求";
      listByyq().then(response => {
        // console.log(response.data);

        this.byyqOptions = this.handleTree(response.data, "byyqId");

        // console.log(this.byyqOptions);
      });
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
        this.form.parentId = row.byyqId;
        this.form.pyfaId = row.pyfaId;
      }
      getByyq(row.byyqId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改毕业要求";
      });
      listByyqExcludeChild(row.byyqId).then(response => {
        this.byyqOptions = this.handleTree(response.data, "byyqId");
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.byyqId != undefined) {
            updateByyq(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addByyq(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除毕业要求编号为"' + row.byyqId + '"的数据项？').then(function() {
        return delByyq(row.byyqId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
