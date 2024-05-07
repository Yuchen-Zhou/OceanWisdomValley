<script setup>
import NavBar from "@/components/index/NavBar.vue";
import { ref } from 'vue';
import Register from '@/components/user/Register.vue';

const videoElement = ref(null);
const isPlaying = ref(true); // 添加一个用于记录视频播放状态的变量

const toggleVideo = () => {
  const video = videoElement.value;
  if (video.paused) {
    video.play();
    isPlaying.value = true; // 更新播放状态为 true
  } else {
    video.pause();
    isPlaying.value = false; // 更新播放状态为 false
  }
};
</script>

<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <NavBar class="navbar"/>
      </el-header>

      <el-main>
        <div class="title-container">
          <h1 class="title">欢迎来到海洋智慧谷</h1>
        </div>

        <div class="register-container">
          <Register />
          <p>已经有账号了？<a href="/login">立即登录</a></p>
        </div>

        <div class="video-background">
          <video ref="videoElement" id="background-video" autoplay loop>
            <source src="@/assets/videos/show.mp4" type="video/mp4">
          </video>
        </div>
        <el-button class="control-button" @click="toggleVideo">{{ isPlaying ? '暂停' : '播放' }}</el-button>
      </el-main>
    </el-container>
  </div>
</template>

<style scoped>
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.video-background {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  z-index: -1;
}

.video-background video {
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.title {
  font-size: 48px; /* Adjust the font size as needed */
  color: #fff; /* Set the color of the title text */
}

.title-container {
  position: absolute;
  top: 15%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1; /* Ensure the title is above the video background */
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.register-container {
  position: absolute;
  top: 50%;
  left: 50%;
  padding: 10px;
  border-radius: 5px;
  transform: translate(-50%, -50%);
  background-color: rgba(255, 255, 255, 0.9);
  z-index: 1; /* Ensure the login form is above the video background */
}

.control-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  padding: 10px 20px;
  background-color: rgba(255, 255, 255, 0.5);
  border: none;
  border-radius: 5px;
  cursor: pointer;
  z-index: 999; /* Ensure the button is above other elements */
}

</style>
