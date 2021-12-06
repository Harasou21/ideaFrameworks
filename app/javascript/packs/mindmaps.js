import Vue from 'vue'
import mindmaps from '../packs/components/mindmaps.vue'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    components: {
      "mindmaps": mindmaps
    },
    render: h => h(mindmaps)
  }).$mount()
  document.body.appendChild(app.$el)
})