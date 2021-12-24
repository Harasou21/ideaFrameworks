<template>

<body>

<draggable>
  <div v-for="mindmap in mindmaps">
    <div>
      <input class="mindmap-text">{{mindmap.text}}
    </div>
    <div id="mindmapNav">
      <button @click="addMindmap">マインドマップを追加</button>
    </div>
  </div>
</draggable>

</body>
</template>


<script >
  import draggable from 'vuedraggable'
  import axios from 'axios'

  export default{
    components:{
        draggable
    },
    data: function(){
      return{
        mindmaps: "mindmaps"
      }
    },
    mounted(){
      this.setMindmaps();
    },
    methods: {
      addMindmap: function(){
        this.mindmaps.push({text: ''})
      },
      setMindmaps: function(){
        axios.get('/api/mindmaps')
          .then(response=>(
            this.mindmaps = response.data
          ))
      }
    }
  }

// 枠線を付与する
// クリックごとに枠線を切り替える
// 「マインドマップを追加」というナビゲーションがでてくる
// それをクリックしたらブロックが追加される
// 追加したら線を引く

// それぞれのマインドマップで、分岐ができるように識別
// できるように、idが必須。
// マインドマップの位置も記憶しておきたいから
// dbにx軸、y軸のカラムを追加しとくのもあり
// すでにあるマインドマップのx軸、y軸を取得して
// それplusマインドマップのwidth,height分
// に新たなマインドマップを配置すれば、いい感じの位置に
// マインドマップを置けそう


// 1.railsからmindmapsデータをとってくる
// 2.mindmapsにx,yカラムを追加
// ドラッグのやり方を学ぶ
// ドラッグイベントのときに、x軸、ｙ軸を更新する
// のをaxiosで実装
// 線を引く方法を学ぶ
// 線をどのように保存するのかを考える。
// lineモデルを作成して、x軸、y軸のカラムを追加
// mindmapsと紐付け

</script>

