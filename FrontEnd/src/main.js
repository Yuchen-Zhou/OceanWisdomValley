import {createApp} from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'


const app = createApp(App)

// 将 echarts 注册为全局属性


app.use(router)
app.use(ElementPlus)

app.mount('#app')
