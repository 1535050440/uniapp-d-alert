## 2020-09-06 d-alert 自定义弹框alert showModel


#### 1. 使用 （样式使用scss）
````

<d-alert></d-alert>


this.$showModal({
  content: '这是一个自定义弹框',
  showCancel:false,
  success(res) {
    if (res.confirm) {
      console.log('用户点击确定')
    } else if (res.cancel) {
      console.log('用户点击取消')
    }
  }
})

````

#### 3.放置在main,js文件中 必须先引入Vuex 
````
import Vuex from 'vuex'
import store from './store'

Vue.prototype.$store = store

import initModal from "@/store/myAlert.js";
initModal(Vue);
````

----
| 参数       | 说明   |类型    |  默认值 |
| --------   | -----:  |-----:  | :----:  |
| title    | 标题 |String  |   ''    |
| content     | 内容 | String |   '暂无' |
| showCancel     | 是否显示取消按钮 | Boolean |   true |
| cancelText    | 取消按钮的文字 | String  |  '取消'     |
| cancelColor    | 取消按钮的文字颜色 | HexColor  |  '#000000'     |
| confirmText    | 确定按钮的文字 | String  |  '确定'     |
| confirmColor    | 确定按钮的文字颜色 | HexColor  |  '#762cd9'     |
| success    | 接口调用成功的回调函数 | Function  |  ''     |
| hideTabBar    | 是否隐藏tabBar在APP和小程序中隐藏tabBar 可以让遮罩层全屏 | Boolean  |  ''     |




------


#### 注
（非原创）链接：https://www.cnblogs.com/vip-deng-vip/

------
##
````

this.$showModal({
    title:"我是标题",
    content:'我内容',
    showCancel:true,
    cancelText:"取消",
    cancelColor:"#000000",
    confirmText:"确定",
    confirmColor:"red",
    hideTabBar:true,
    success:function(res){
        if(res.confirm){
            wx.showToast({
                title: '点击了确定',
                icon: 'none',
                duration: 2000
            })
        }else{
            wx.showToast({
                title: '点击了取消',
                icon: 'none',
                duration: 2000
            })
        }
    },
})

````

## 更新日志

* 2020年09月06日 v1.0.0
    *  增加自定义弹框（随意修改弹框样式）
	*  优化细节

