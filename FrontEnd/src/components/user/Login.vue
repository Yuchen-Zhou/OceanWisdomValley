<template>
  <div>
    <el-form :model="form"
             label-width="auto"
             label-position="top"
             style="max-width: 600px">
      <el-form-item label="邮箱: ">
        <el-input v-model="form.email" style="width: 300px;" placeholder="请输入你的注册邮箱"></el-input>
      </el-form-item>

      <el-form-item label="密码: ">
        <el-input v-model="form.password"
                  type="password" show-password="true"
                  placeholder="请输入你的密码"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary"
                   @click="onSubmit"
                   round="true">登录
        </el-button>
        <el-button type="primary" @click="redirect" :link="true">
          忘记密码
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import {ref} from 'vue';
import axios from "axios";
import {ElForm, ElFormItem, ElInput, ElButton, ElSelect, ElOption, ElMessage} from 'element-plus';
import {useRouter} from 'vue-router';

const form = ref({
  email: '',
  password: ''
});

const onSubmit = async () => {
  for (const key in form.value) {
    if (!form.value[key]) {
      ElMessage.error('请输入邮箱或密码');
      return;
    }
  }



  const router = useRouter();

  try {
    const response = await fetch('http://192.168.31.96:8000/login/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: form.value.email,
        password: form.value.password
      })
    });

    if (response.ok) {
      const responseData = await response.json();
      console.log('后端返回的数据:', responseData);
      // localStorage.setItem('user_info', JSON.stringify(responseData.user_info));
      ElMessage.success('登录成功!即将跳转至控制台');
      await router.push('/dashboard'); // 使用路由跳转
    } else {
      console.error('登录失败', response);
      ElMessage.error('登录失败, 用户名或密码错误');
    }
  } catch (error) {
    console.error('登录失败', error);
    ElMessage.error('登录失败, 用户名或密码错误');
  }

}

const redirect = () => {
  window.location.href = '/reset';
}


</script>

<style scoped>

</style>