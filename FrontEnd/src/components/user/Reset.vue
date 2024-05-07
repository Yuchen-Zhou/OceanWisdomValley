<template>
  <div>

    <el-form :model="form"
             label-width="auto"
             label-position="top"
             style="max-width: 600px">
      <el-form-item label="邮箱: ">
        <el-input v-model="form.email" style="width: 300px" placeholder="请输入你的邮箱..."></el-input>
      </el-form-item>

      <el-form-item label="修改后的密码: ">
        <el-input v-model="form.confirmPassword"
                  type="password" show-password="true"
                  placeholder="请输入你修改后的密码..."></el-input>
      </el-form-item>
      <el-form-item label="邮箱验证码: ">
        <el-input v-model="form.verificationCode" placeholder="请输入接收到的验证码"></el-input>
        <el-button type="primary" @click="sendCode">发送验证码</el-button>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit" :plain="true">修改密码</el-button>
      </el-form-item>
    </el-form>

  </div>
</template>

<script setup>
import {ref} from 'vue';
import {ElForm, ElFormItem, ElInput, ElButton, ElSelect, ElOption, ElMessage} from 'element-plus';

const form = ref({
  password: '',
  email: '',
  verificationCode: ''
});

const onSubmit = () => {
  for (const key in form.value) {
    if (!form.value[key]) {
      ElMessage.error('请完整填写表单信息');
      return;
    }
  }

  if (form.value.password !== form.value.confirmPassword) {
    ElMessage.error('两次密码不一致，请重新输入');
    return;
  }

  console.log('获取到的数据:', form.value);
}

const sendCode = () =>{
  console.log('发送验证码');
}




</script>

<style scoped>
</style>