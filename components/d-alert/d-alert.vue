<template>
	<view class="dAlert" v-show="show">
		<!--  -->
		<view class="wrapperAlert" @click="closeModal">
			<view class="wrapperAlertBox" @click.stop="" @touchmove.stop.prevent="">
				<view style="width: 100%;height: 50rpx;"></view>
				<view class="wrapperAlertBoxTitle" v-if="title">
					{{title}}
				</view>
				
				<view class="wrapperAlertBoxCenter">
					{{content}}
				</view>
				<view class="wrapperAlertBoxBit"></view>
				
				<view class="wrapperAlertBoxFooter">
					<view class="wrapperAlertBoxFooterBox"  v-if="showCancel" :style="cancelColor" @click.stop="clickBtn('cancel')">{{cancelText}}</view>
					<view class="wrapperAlertBoxFooterBit" v-if="showCancel"></view>
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
				this.$modalStore.commit('success',res)
				this.$modalStore.commit('hideModal')
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
		opacity: 0.4;
		transition: background-color .15s linear;
	}
	
	.wrapperAlert {
		z-index: 12000;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		transition: background-color .15s linear;
		display: flex;
		align-items: center;
		justify-content: center;
		
		.wrapperAlertBox {
			width: 80%;
			background-color: #fff;
			border-radius: 15rpx;
			background-image: linear-gradient(-27deg,#fff,#762cd9);
			background-image: linear-gradient(-27deg,#fff,pink);
			background-image: linear-gradient(-27deg,#fff,pink);
			.wrapperAlertBoxTitle {
				width: 100%;
				height: 30rpx;
				display: flex;
				justify-content: center;
				align-items: center;
				color: #762cd9;
			}
			.wrapperAlertBoxCenter {
				width: 100%;
				height: 135rpx;
				display: flex;
				justify-content: center;
				align-items: center;
				color: #C0C0C0;
				color: red;
				
			}
			.wrapperAlertBoxBit {
				width: 100%;
				height: 1rpx;
				background-color: #f2f2f2;
			}
			
			.wrapperAlertBoxFooter {
				width: 100%;
				height: 100rpx;
				// background-color: red;
				display: flex;
				justify-content: space-around;
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
					height:40rpx;
					background:#f2f2f2;
				}
			}
			
		}
		
	
	
	}
</style>
