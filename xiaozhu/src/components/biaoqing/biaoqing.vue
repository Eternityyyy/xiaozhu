<template>
  <div class="biaoqing">
    <div class="biaoqingContent">
      <img class="expression" @click.stop="show=!show" src="./expression.png" />
      <!--      文本框内容-->
      <div contenteditable="true" @click.stop="contentClick" @blur="onBlur" @change="onBlur" class='contentBox' :id="id" >
      </div>
      <!--      表情选择框-->
			<button @click="send" class="msgsend_btn" :class="{msgsend_btn_pink: content.length > 0}">发送</button>
    </div>
		<div class='box' v-show="show" @click.stop>
			<div class='right'>
				<button v-for='(i,index) in rightList' :key="index" class='emoji' @click.stop="insertHtmlAtCaret(i.className,i.icon)">
					<img src="http://tkeasyemoji.oss-cn-shanghai.aliyuncs.com/images/placeholder.png" :class='i.className' :alt="i.icon">
				</button>
			</div>
		</div>
  </div>
</template>
<script>
  // 定义最后光标对象
  import {
    biaoqingArr
  } from "./biaoqing.js";
  export default {
    props:{
      //表情框宽度
      width:{
        type:String,
        default:'50%',
      },
      //表情框高度
      height:{
        type:String,
        default:'200px',
      },
      //表情框ID
      id:{
        type:String,
        default:'text',
      },
      //内容
      value:{
        type:String,
        default:'',
      },
    },
    data() {
      return {
        lastEditRange:'',
        content: "",
        show: false,
        biaoqingList: biaoqingArr,
        biaoqingActive: 0,
        rightList: [],
        allList:[],
      };
    },
    watch:{
      value(){
				console.log(this.value)
        this.valueChange();
      },
			show(val){
				this.$emit('showchange',val)
			}
    },
    methods: {
      valueChange(){
        if(!this.value)return;
        let str = this.value;
        let newStr =this.forArr(this.forArr(str),'className');
				console.log(newStr)
        document.getElementById(this.id).innerHTML = newStr;
      },
      //替换emoji 表情图片
      forArr(str,_type){
        for (let j = 0; j < this.allList.length; j++) {
          let val = this.allList[j];
          let reg =_type==='className'?`alt${val.className}`:val.icon;
          if(_type==='className'){
            str = str.replace(new RegExp(reg,'g'),val.icon)
          }else{
            str= str.replace(new RegExp(reg,'g'),`<img style="vertical-align: sub;" src="http://tkeasyemoji.oss-cn-shanghai.aliyuncs.com/images/placeholder.png" class="${val.className}" alt="alt${val.className}">`)
          }
        }
        return str;
      },
      //失去焦点 内容返回
      onBlur(){
        let text = document.getElementById(this.id).innerHTML;
				this.content = text
      },
      contentClick(){
        // 获取选定对象
        var selection = getSelection()
        // 设置最后光标对象
        this.lastEditRange = selection.getRangeAt(0)
      },
      //表情插入文本框
      insertHtmlAtCaret(className,icon) {
				// console.log(className,icon)
        var edit = document.getElementById(this.id);
        // 编辑框设置焦点
        edit.focus();
        var sel = getSelection();
        // 判断是否有最后光标对象存在
        if (this.lastEditRange) {
          // 存在最后光标对象，选定对象清除所有光标并添加最后光标还原之前的状态
          sel.removeAllRanges()
          sel.addRange(this.lastEditRange)
        }
        var html = `<img style="vertical-align: sub;" src="http://tkeasyemoji.oss-cn-shanghai.aliyuncs.com/images/placeholder.png" class="${className}" alt="${icon}">`;
        var  range;
				if (window.getSelection) {
					// IE9 and non-IE
					sel = window.getSelection();
					if (sel.getRangeAt && sel.rangeCount) {
						range = sel.getRangeAt(0);
						range.deleteContents();
						var el = document.createElement("div");
						el.innerHTML = html;
						var frag = document.createDocumentFragment(), node, lastNode;
						while ((node = el.firstChild)) {
							lastNode = frag.appendChild(node);
						}
						range.insertNode(frag);
						if (lastNode) {
							range = range.cloneRange();
							range.setStartAfter(lastNode);
							range.collapse(true);
							sel.removeAllRanges();
							sel.addRange(range);
						}
					}
				} else if (document.selection && document.selection.type != "Control") {
					// IE < 9
					document.selection.createRange().pasteHTML(html);
				}
        // 无论如何都要记录最后光标对象
        this.lastEditRange = sel.getRangeAt(0)
        },
				send(){
					let text = document.getElementById(this.id).innerHTML;
					document.getElementById(this.id).innerHTML = ''
					this.content = text
					this.$emit('send',text)
				}
    },
    created() {
      this.rightList = biaoqingArr[1].iconArr;
      biaoqingArr.forEach(e=>{
        this.allList =this.allList.concat(e.iconArr)
      });
    },
    mounted() {
      this.valueChange();
      let that = this;
      document.body.onclick=function () {
        that.show = false;
      }
    },
    components: {}
  };
</script>
<style>
  @import "./emoji_sorites.css";
</style>
<style lang='less' scoped>
	.biaoqing{
		position: fixed;
		background-color: #f5f5f5;
		padding: 0;
		border-top: 0.026667rem solid #e6e6e6;
		bottom: 0;
		left: 0;
		width: 100%;
		.box{
			background: #fff;
		}
		button{
			border: 0;
			background: #fff;
		}
	}
  .contentBox {
		min-height: .8rem;
		line-height: .8rem;
    border: .026667rem solid #e0e0e0;
		margin-right: 1.546667rem;
		margin-left: 1.013333rem;
		border-radius: .426667rem;
		outline: none;
		text-indent: .266667rem;
		background: #fff;
  }
  .biaoqingContent {
    padding: 0.133333rem 0;
		position: relative;
    .expression{
			left: 0.16rem;
      width: .7466666rem;
			height: .733333rem;
      cursor: pointer;
			position: absolute;
			top: 0.1999rem;
    }
    .msgsend_btn{
			background: #bdbdbd;
			color: #fff;
			font-weight: 700;
			border-radius: .426667rem;
			position: absolute;
			bottom: .24rem;
			right: .266667rem;
			display: block;
			width: 1.066667rem;
			height: .64rem;
			text-align: center;
			line-height: .693333rem;
			text-decoration: none;
			border: 0;
		}
		.msgsend_btn_pink{
			background-color: #ff4081;
		}
    .right {
      flex: 1;
      padding-left: 10px;
      padding-top: 15px;
      overflow: auto;
      button {
        border: none;
        padding: 0;
        cursor: pointer;
      }
      .emoji {
        display: inline-block;
        padding: 3px;
        border: 1px solid transparent;
        cursor: pointer;
        background: #fff;
        &:hover {
          height: 32px;
          background-color: #ddded8;
          border: 1px solid #b3c1fd;
          border-radius: 4px;
        }
      }
    }
    //样式一
    .box0{
    }
  }
</style>