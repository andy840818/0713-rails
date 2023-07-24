import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
static target = ["count"]

  hi(e){
    e.preventDefault();
    const currentCount = +this.currentTarget.textContent  ;
    this.countTarget.textContent = currentCount+1;

    if (currentCount>= 5){
      // 發送abc事件
      const o = {detail: {cc: currentCount}}
      const evt = new CoustcomEvent('abc') 
      wundow.dispatchEvent(evt)
    }
  }
}
