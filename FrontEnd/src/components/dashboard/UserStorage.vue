<template>
  <h2>用户基本信息</h2>
  <div class="chart-container">
    <div ref="userActivityChart" class="chart"></div>
    <div ref="userStorageChart" class="chart"></div>
  </div>
</template>

<!--<script>-->
<!--import axios from "axios";-->
<!--import * as echarts from "echarts";-->

<!--export default {-->
<!--  data() {-->
<!--    return {-->
<!--      userActivityChart: null,-->
<!--      userStorageChart: null-->
<!--    };-->
<!--  },-->
<!--  mounted() {-->
<!--    this.fetchUserActivityData();-->
<!--    this.fetchUserStorageData();-->
<!--  },-->
<!--  methods: {-->
<!--    fetchUserActivityData() {-->
<!--      axios.get('http://127.0.0.1:8008/dashboard/get_user_activity_info')-->
<!--        .then(response => {-->
<!--          this.renderChart(this.$refs.userActivityChart, response.data);-->
<!--        })-->
<!--        .catch(error => {-->
<!--          console.error('Error fetching user activity data:', error);-->
<!--        });-->
<!--    },-->
<!--    fetchUserStorageData() {-->
<!--      axios.get('http://127.0.0.1:8008/dashboard/get_user_storage')-->
<!--        .then(response => {-->
<!--          this.renderChart(this.$refs.userStorageChart, response.data);-->
<!--        })-->
<!--        .catch(error => {-->
<!--          console.error('Error fetching user storage data:', error);-->
<!--        });-->
<!--    },-->
<!--    renderChart(chartElement, data) {-->
<!--      const chart = echarts.init(chartElement);-->
<!--      // Use data to configure echarts chart-->
<!--      const option = {-->
<!--        // Echarts configuration based on fetched data-->
<!--      };-->
<!--      chart.setOption(option);-->
<!--    }-->
<!--  }-->
<!--};-->

<!--</script>-->


<style scoped>
/* 图表容器样式 */
.chart-container {
  display: flex;
  justify-content: space-between;
  background-color: rgba(255, 255, 255, 0.8);
  /* 设置不透明的白色背景 */
  padding: 20px;
  /* 添加内边距 */
  border-radius: 10px;
  /* 圆角边框 */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  /* 添加阴影效果 */
  margin-bottom: 20px;
  /* 添加下边距 */
}

/* 每个图表样式 */
.chart {
  width: calc(50% - 20px);
  /* 计算每个图表的宽度为父容器的一半减去内边距 */
  height: 400px;
  border: 1px solid #ddd;
  /* 添加边框 */
  border-radius: 5px;
  /* 圆角边框 */
  padding: 10px;
  /* 添加内边距 */
}

/* 图表标题样式 */
.chart-title {
  text-align: center;
  /* 文字居中 */
  font-size: 18px;
  /* 设置字体大小 */
  margin-bottom: 10px;
  /* 添加下边距 */
}
</style>