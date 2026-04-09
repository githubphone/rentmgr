<template>
	<view class="taro-section">
		<view class="taro-section-header" @click="onClick">
			<view class="taro-section-header__decoration" v-if="type" :class="type" />
			<slot v-else name="decoration"></slot>

			<view class="taro-section-header__content">
				<text :style="{'font-size':titleFontSize,'color':titleColor}" class="taro-section__content-title" :class="{'distraction':!subTitle}">{{ title }}</text>
				<text v-if="subTitle" :style="{'font-size':subTitleFontSize,'color':subTitleColor}" class="taro-section-header__content-sub">{{ subTitle }}</text>
			</view>

			<view class="taro-section-header__slot-right">
				<slot name="right"></slot>
			</view>
		</view>

		<view class="taro-section-content" :style="{padding: _padding}">
			<slot />
		</view>
	</view>
</template>

<script setup lang="ts">

	/**
	 * Section 标题栏
	 * @description 标题栏
	 * @property {String} type = [line|circle|square] 标题装饰类型
	 *  @value line 竖线
	 *  @value circle 圆形
	 *  @value square 正方形
	 * @property {String} title 主标题
	 * @property {String} titleFontSize 主标题字体大小
	 * @property {String} titleColor 主标题字体颜色
	 * @property {String} subTitle 副标题
	 * @property {String} subTitleFontSize 副标题字体大小
	 * @property {String} subTitleColor 副标题字体颜色
	 * @property {String} padding 默认插槽 padding
	 */

	import { computed, watch } from 'vue'

	const props = defineProps({
		type: {
			type: String,
			default: ''
		},
		title: {
			type: String,
			required: true,
			default: ''
		},
		titleFontSize: {
			type: String,
			default: '14px'
		},
		titleColor:{
			type: String,
			default: '#333'
		},
		subTitle: {
			type: String,
			default: ''
		},
		subTitleFontSize: {
			type: String,
			default: '12px'
		},
		subTitleColor: {
			type: String,
			default: '#999'
		},
		padding: {
			type: [Boolean, String] as any,
			default: false
		}
	})

	const emit = defineEmits(['click'])

	const _padding = computed(() => {
		if (typeof props.padding === 'string') {
			return props.padding
		}

		return props.padding ? '10px' : ''
	})

	watch(() => props.title, (newVal) => {
		// 移除 uni.report 调用，使用 Taro 原生 API 或自定义上报
		console.log('Title changed:', newVal)
	})

	const onClick = () => {
		emit('click')
	}
</script>
<style lang="scss" >
	$taro-primary: #2979ff !default;

	.taro-section {
		background-color: #fff;
		.taro-section-header {
			position: relative;
			display: flex;
			flex-direction: row;
			align-items: center;
			padding: 12px 10px;
			font-weight: normal;

			&__decoration{
				margin-right: 6px;
				background-color: $taro-primary;
				&.line {
					width: 4px;
					height: 12px;
					border-radius: 10px;
				}

				&.circle {
					width: 8px;
					height: 8px;
					border-top-right-radius: 50px;
					border-top-left-radius: 50px;
					border-bottom-left-radius: 50px;
					border-bottom-right-radius: 50px;
				}

				&.square {
					width: 8px;
					height: 8px;
				}
			}

			&__content {
				display: flex;
				flex-direction: column;
				flex: 1;
				color: #333;

				.distraction {
					flex-direction: row;
					align-items: center;
				}
				&-sub {
					margin-top: 2px;
				}
			}

			&__slot-right{
				font-size: 14px;
			}
		}

		.taro-section-content{
			font-size: 14px;
		}
	}
</style>
