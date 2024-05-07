<template>
  <div>
    <el-menu
        active-text-color="#ffd04b"
        background-color="#545c64"
        class="el-menu-vertical-demo"
        default-active="2"
        text-color="#fff"
        :router="true"
        @open="handleOpen"
        @close="handleClose"
    >
      <el-menu-item index="/">
        <span>首页</span>
      </el-menu-item>
      <el-menu-item index="/dashboard">
        <span>控制台</span>
      </el-menu-item>
      <el-sub-menu>
        <template #title>
          <router-link to="/seaVision">海洋视觉处理</router-link>
        </template>
        <el-menu-item index="/seaVision/ImageRecognition">图片识别</el-menu-item>
        <el-menu-item index="/seaVision/VideoDetect">视频检测</el-menu-item>
        <el-menu-item index="/seaVision/ImageReconstruction">图像重构</el-menu-item>
      </el-sub-menu>
      <el-sub-menu>
        <template #title>
          <router-link to="/seaLLMs">海洋语言模型</router-link>
        </template>
        <el-menu-item index="/seaLLMs/tongyi">通义大模型</el-menu-item>
      </el-sub-menu>
      <el-menu-item index="/seaResource">
        <span>海洋资源管理</span>
      </el-menu-item>
    </el-menu>
  </div>

</template>

<script lang="ts" setup>
import {
  Document,
  Menu as IconMenu,
  Location,
  Setting,
} from '@element-plus/icons-vue'

const handleOpen = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
const handleClose = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
</script>
