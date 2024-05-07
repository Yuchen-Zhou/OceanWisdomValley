<template>
  <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      :ellipsis="false"
      @select="handleSelect"
      :router="true"
  >
    <img style="width: 100px; height: 60px"
         src="@/assets/imgs/station.png">
    <el-menu-item index="/">
      首页
    </el-menu-item>
    <el-menu-item index="/dashboard">
      控制台
    </el-menu-item>
    <el-menu-item index="/seaVision">
      海洋视觉处理
    </el-menu-item>
    <el-menu-item index="/seaLLMs">
      海洋语言模型
    </el-menu-item>
    <el-menu-item index="seaResource">
      海洋资源管理
    </el-menu-item>
    
    <div class="flex-grow"/>
    <el-menu-item index="/login">
      注册/登录
    </el-menu-item>
  </el-menu>
</template>

<script setup>
import {ref} from 'vue'

const activeIndex = ref('1')

</script>

<style>
.flex-grow {
  flex-grow: 1;
}

.router-link {
  text-decoration: none;
  color: inherit;
}
</style>
