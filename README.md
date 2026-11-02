<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Radio Catrachos de Corazon</title>
    <style>
        body {
            margin: 0;
            background-color: #0b0b0b;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        .player-container {
            position: relative;
            width: 320px;
            height: 220px;
            background: #111;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.8);
            overflow: hidden;
            border: 2px solid #d4af37;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }
        .player-overlay {
            width: 100%;
            background: rgba(0, 0, 0, 0.85);
            padding: 12px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .controls {
            display: flex;
            gap: 10px;
            margin-bottom: 8px;
        }
        button {
            background: #d4af37;
            color: #000;
            border: none;
            padding: 6px 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background: #ffc72c;
        }
        .now-playing {
            color: #fff;
            font-size: 12px;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="player-container">
        <div class="player-overlay">
            <div class="controls">
                <button onclick="playRadio()">▶ Play</button>
                <button onclick="stopRadio()">⏹ Stop</button>
            </div>
            <div class="now-playing" id="songInfo">Radio Catrachos de Corazon</div>
        </div>
    </div>

    <audio id="radioStream" src="https://radio.technoplayerserver.com/8010/stream"></audio>

    <script>
        const audio = document.getElementById('radioStream');
        const songInfo = document.getElementById('songInfo');

        function playRadio() {
            audio.play().catch(e => console.log("Error:", e));
            songInfo.innerText = "Reproduciendo en vivo...";
        }

        function stopRadio() {
            audio.pause();
            audio.currentTime = 0;
            songInfo.innerText = "Transmisión detenida";
        }
    </script>
</body>
</html>
