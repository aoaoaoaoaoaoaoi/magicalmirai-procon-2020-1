import { Player } from "textalive-app-api";

// 単語が発声されていたら #text に表示する
const animateWord = function (now, unit) {
  if (unit.contains(now)) {
    document.querySelector("#text").textContent = unit.text;
  }
};

// TextAlive Player を作る
const player = new Player({ app: true });
player.addListener({
  // 動画オブジェクトの準備が整ったとき（楽曲に関する情報を読み込み終わったとき）に呼ばれる
  onVideoReady: (v) => {
    // 定期的に呼ばれる各単語の "animate" 関数をセットする
    let w = player.video.firstWord;
    while (w) {
      w.animate = animateWord;
      w = w.next;
    }
  },
});

player.addListener({
    onAppReady: (app) => {
      if (!app.songUrl) {
        // URLを指定して楽曲をもとにした動画データを作成
        p.createFromSongUrl("http://www.youtube.com/watch?v=KdNHFKTKX2s");
      }
      if (!app.managed) {
        // 再生コントロールを表示
        showControls();
      }
    },
  });