<template>
	<view class="_showModal" v-show="show">
		<!--  -->
		<view class="wrapperAlert" >
			<view class="wrapperAlertBox" @click="closeModal" @touchmove.stop.prevent="">
				<view class="wrapperAlertBoxWrapper">
					<view class="wrapperAlertBoxWrapperTop">
						{{title}}
					</view>
					<view class="wrapperAlertBoxWrapperCenter">
						{{content}}
					</view>
				</view>
				
				<view class="wrapperAlertBoxFooter">
					<view class="wrapperAlertBoxFooterBox"  v-show="showCancel" :style="cancelColor" @click.stop="clickBtn('cancel')">{{cancelText}}</view>
					<view class="wrapperAlertBoxFooterBit"></view>
					<view class="wrapperAlertBoxFooterBox" :style="confirmColor" @click.stop="clickBtn('confirm')">{{confirmText}}</view>
				</view>
			</view>
		</view>
		<!--  -->
		<view class="maskHiddenmask" v-show="show"></view>
		<!--  -->
	</view>
</template>

<script>
	export default {
		computed: {
			show(){
				return this.$modalStore.state.show;
			},
			title(){
				return this.$modalStore.state.title;
			},
			content(){
				return this.$modalStore.state.content;
			},
			showCancel(){
				return this.$modalStore.state.showCancel;
			},
			cancelText(){
				return this.$modalStore.state.cancelText;
			},
			cancelColor(){
				return "color:"+this.$modalStore.state.cancelColor;
			},
			confirmText(){
				return this.$modalStore.state.confirmText;
			},
			confirmColor(){
				return "color:"+this.$modalStore.state.confirmColor;
			}
		},
		props:{
		},
		data() {
			return {
			};
		},
		watch:{
			alertStatus(e){
				if (e==true) {
					this.alertStatus = true
				}
				
			}
		},
		methods:{
			closeModal(){
				this.$modalStore.commit('hideModal')
			},
			clickBtn(res){
				this.$modalStore.commit('hideModal')
				this.$modalStore.commit('success',res)
			},
			demo(){
				this.alertStatus = this.alertStatus==true?false:true
			}
		},
		beforeDestroy(){
			this.$modalStore.commit('hideModal')
		}
	}
</script>

<style lang="scss" scoped>
	.maskHiddenmask {
		z-index: 10000;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #000;
		opacity: 0.6;
		transition: background-color .15s linear;
	}
	
	.wrapperAlert {
		z-index: 12000;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		// background-color: #000;
		transition: background-color .15s linear;
		display: flex;
		align-items: center;
		justify-content: center;
		
		.wrapperAlertBox {
			width: 600rpx;
			height: 531rpx;
			// background-color: red;
			background: url('https://cdn.chexiang365.net/static/wx/alert.png') no-repeat;
			background-size: 100% 531rpx;
			padding-top: 100rpx;
			position: relative;
			
			.wrapperAlertBoxWrapper {
				width: 100%;
				height: 300rpx;
				// background-color: yellow;
				padding: 0 80rpx;
				
				.wrapperAlertBoxWrapperTop {
					width: 100%;
					height: 100rpx;
					// background-color: #9bf;
					display: flex;
					justify-content: center;
					align-items: center;
					//
					font-size:35rpx;
					font-family:Source Han Sans CN;
					font-weight:bold;
					color:rgba(77,72,71,1);
				}
				.wrapperAlertBoxWrapperCenter {
					width: 100%;
					height: 200rpx;
					// background-color: red;
					display: flex;
					justify-content: center;
					align-items: center;
					text-align: center;
					line-height: 50rpx;
				}
			}
		
			.wrapperAlertBoxFooter {
				position: absolute;
				bottom:0;
				width: 100%;
				height: 115rpx;
				// background-color: red;
				display: flex;
				justify-content: space-between;
				align-items: center;
				.wrapperAlertBoxFooterBox {
					width: 290rpx;
					height: 115rpx;
					// background-color: #ccc;
					display: flex;
					justify-content: center;
					align-items: center;
				}
				.wrapperAlertBoxFooterBit {
					width:1rpx;
					height:30rpx;
					background:rgba(77,72,71,1);
				}
			}
		}
	}
</style>
