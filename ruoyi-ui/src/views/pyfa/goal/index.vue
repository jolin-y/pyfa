<template>
  <div class="app-container">
<!--    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">-->

<!--      <el-form-item label="方案版本" prop="pyfaId">-->
<!--        <el-select v-model="queryParams.pyfaId" placeholder="培养方案版本" clearable size="small">-->
<!--          <el-option-->
<!--            v-for="dict in dict.type.xpu_pyfa_version"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          />-->
<!--        </el-select>-->
<!--      </el-form-item>-->





<!--&lt;!&ndash;      <el-form-item label="培养方案id" prop="pyfaId">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.pyfaId"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入培养方案id"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->


<!--&lt;!&ndash;      <el-form-item label="描述信息" prop="describe">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.describe"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入描述信息"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->
<!--&lt;!&ndash;      <el-form-item label="指标点1" prop="goal1">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.goal1"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入指标点1"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->
<!--&lt;!&ndash;      <el-form-item label="指标点2" prop="goal2">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.goal2"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入指标点2"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->
<!--&lt;!&ndash;      <el-form-item label="指标点3" prop="goal3">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.goal3"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入指标点3"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->
<!--&lt;!&ndash;      <el-form-item label="指标点4" prop="goal4">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.goal4"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入指标点4"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->
<!--&lt;!&ndash;      <el-form-item label="指标点5" prop="goal5">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-input&ndash;&gt;-->
<!--&lt;!&ndash;          v-model="queryParams.goal5"&ndash;&gt;-->
<!--&lt;!&ndash;          placeholder="请输入指标点5"&ndash;&gt;-->
<!--&lt;!&ndash;          clearable&ndash;&gt;-->
<!--&lt;!&ndash;          size="small"&ndash;&gt;-->
<!--&lt;!&ndash;          @keyup.enter.native="handleQuery"&ndash;&gt;-->
<!--&lt;!&ndash;        />&ndash;&gt;-->
<!--&lt;!&ndash;      </el-form-item>&ndash;&gt;-->

<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->

<!--    表单-->
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">

<!--      <el-form-item label="方案版本" prop="pyfaId">-->
      <el-form-item label="方案版本">
        <el-select v-model="form.pyfaId" placeholder="培养方案版本" size="small" @change='getValue'>
          <el-option
            v-for="dict in dict.type.xpu_pyfa_version"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>


      <el-form-item label="描述信息" prop="describe">
        <el-input v-model="form.describe" type="textarea" placeholder="请输入描述信息"
                  :autosize="{minRows: 5, maxRows: undefined}" :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="指标点1" prop="goal1">
        <el-input v-model="form.goal1" type="textarea" placeholder="请输入指标点1" :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="指标点2" prop="goal2">
        <el-input v-model="form.goal2" type="textarea" placeholder="请输入指标点2" :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="指标点3" prop="goal3">
        <el-input v-model="form.goal3" type="textarea" placeholder="请输入指标点3" :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="指标点4" prop="goal4">
        <el-input v-model="form.goal4" type="textarea" placeholder="请输入指标点4" :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="指标点5" prop="goal5">
        <el-input v-model="form.goal5" type="textarea" placeholder="请输入指标点5" :style="{width: '100%'}">
        </el-input>
      </el-form-item>

      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">保 存</el-button>
        <el-button @click="cancel">取 消</el-button>
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
<!--          v-hasPermi="['system:goal:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['system:goal:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['system:goal:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:goal:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
<!--    </el-row>-->

<!--页面下方的数据列表-->
<!--    <el-table v-loading="loading" :data="goalList" @selection-change="handleSelectionChange">-->
<!--      <el-table-column type="selection" width="55" align="center" />-->
<!--      <el-table-column label="培养目标id" align="center" prop="goalId" />-->
<!--      <el-table-column label="培养方案id" align="center" prop="pyfaId" />-->
<!--      <el-table-column label="描述信息" align="center" prop="describe" />-->
<!--      <el-table-column label="指标点1" align="center" prop="goal1" />-->
<!--      <el-table-column label="指标点2" align="center" prop="goal2" />-->
<!--      <el-table-column label="指标点3" align="center" prop="goal3" />-->
<!--      <el-table-column label="指标点4" align="center" prop="goal4" />-->
<!--      <el-table-column label="指标点5" align="center" prop="goal5" />-->
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['system:goal:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['system:goal:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--    </el-table>-->

<!--    <pagination-->
<!--      v-show="total>0"-->
<!--      :total="total"-->
<!--      :page.sync="queryParams.pageNum"-->
<!--      :limit.sync="queryParams.pageSize"-->
<!--      @pagination="getList"-->
<!--    />-->

    <!-- 添加或修改培养目标表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="培养方案id" prop="pyfaId">-->
<!--          <el-input v-model="form.pyfaId" placeholder="请输入培养方案id" />-->
<!--        </el-form-item>-->

        <el-form-item label="方案版本">
          <el-select v-model="form.pyfaId" placeholder="培养方案版本" size="small" @change='getValue'>
            <el-option
              v-for="dict in dict.type.xpu_pyfa_version"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="描述信息" prop="describe">
          <el-input v-model="form.describe" placeholder="请输入描述信息" />
        </el-form-item>
        <el-form-item label="指标点1" prop="goal1">
          <el-input v-model="form.goal1" placeholder="请输入指标点1" />
        </el-form-item>
        <el-form-item label="指标点2" prop="goal2">
          <el-input v-model="form.goal2" placeholder="请输入指标点2" />
        </el-form-item>
        <el-form-item label="指标点3" prop="goal3">
          <el-input v-model="form.goal3" placeholder="请输入指标点3" />
        </el-form-item>
        <el-form-item label="指标点4" prop="goal4">
          <el-input v-model="form.goal4" placeholder="请输入指标点4" />
        </el-form-item>
        <el-form-item label="指标点5" prop="goal5">
          <el-input v-model="form.goal5" placeholder="请输入指标点5" />
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
import { listGoal, getGoal, delGoal, addGoal, updateGoal, exportGoal, getGoal_pyfa } from "@/api/pyfa/goal/goal";

export default {
  name: "Goal",
  dicts: ['xpu_pyfa_version'],
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
      // 培养目标表表格数据
      goalList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        // pageNum: 1,
        // pageSize: 10,
        // pyfaId: null,
        // describe: null,
        // goal1: null,
        // goal2: null,
        // goal3: null,
        // goal4: null,
        // goal5: null
      },
      // 表单参数
      form: {
        // pyfaId: null,
        // describe: null,
        // goal1: null,
        // goal2: null,
        // goal3: null,
        // goal4: null,
        // goal5: null
      },
      // 表单校验
      rules: {
      },

      options:[],

    };
  },
  created() {
    this.getList();
    // this.form.pyfaId =
    // this.options = this.dict.type.xpu_pyfa_version;
    // console.log(this.options);
    //
    // let resdata=Object.assign({},this.options)
    // console.log(resdata)
  },
  methods: {
    /** 表单下拉展示搜索结果 */
    getValue:function(){
      getGoal_pyfa(this.form.pyfaId).then(response => {
        if(response.data != null) {
          // response.data.pyfaId = this.form.pyfaId;
          this.form = response.data;

          // // this.form = response.data;
          // this.form.goalId= response.data.goalId;
          // this.form.describe= response.data.describe;
          // this.form.goal1= response.data.goal1;
          // this.form.goal2= response.data.goal2;
          // this.form.goal3= response.data.goal3;
          // this.form.goal4= response.data.goal4;
          // this.form.goal5= response.data.goal5;
        }
        else {
          const tmp = this.form.pyfaId;
          this.reset();
          this.form.pyfaId = tmp;

        }

        // else {
        //   this.form.goalId= null;
        //   this.form.describe= null;
        //   this.form.goal1= null;
        //   this.form.goal2= null;
        //   this.form.goal3= null;
        //   this.form.goal4= null;
        //   this.form.goal5= null;
        // }

      });
    },




    /** 查询培养目标表列表 */
    getList() {
      this.loading = true;
      listGoal(this.queryParams).then(response => {
        this.goalList = response.rows;
        this.total = response.total;
        this.loading = false;

        // console.log(this.queryParams)
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
        goalId: null,
        pyfaId: null,
        describe: null,
        goal1: null,
        goal2: null,
        goal3: null,
        goal4: null,
        goal5: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();

      // console.log(this.goalList)
      // console.log(this.goalList[0])
      // console.log([this.form.goalId])

    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.goalId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加培养目标表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const goalId = row.goalId || this.ids
      //
      // console.log(row.goalId)
      // console.log(row.ids)
      // console.log(goalId)

      getGoal(goalId).then(response => {
        console.log(response.data)

        this.form = response.data;
        this.open = true;
        this.title = "修改培养目标表";
      });
    },

    // /** 修改按钮操作 */
    // handleUpdate() {
    //   this.reset();
    //   console.log(this.queryParams.pyfaId)
    //   getGoal_pyfa(this.queryParams.pyfaId).then(response => {
    //       this.form = response.data;
    //     }
    //   );
    // },


    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.goalId != null) {
            updateGoal(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGoal(this.form).then(response => {
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
      const goalIds = row.goalId || this.ids;
      this.$modal.confirm('是否确认删除培养目标表编号为"' + goalIds + '"的数据项？').then(function() {
        return delGoal(goalIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有培养目标表数据项？').then(() => {
        this.exportLoading = true;
        return exportGoal(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
