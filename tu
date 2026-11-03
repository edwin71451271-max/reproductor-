<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Radio Catrachos de Corazon - Dark Gold Player</title>
    <style>
        body {
            margin: 0;
            background-color: #050505;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .cyber-card {
            width: 380px;
            background: linear-gradient(145deg, #110d08, #050302);
            border: 2px solid #ff7700;
            border-radius: 18px;
            box-shadow: 0 0 35px rgba(255, 119, 0, 0.45), inset 0 0 20px rgba(255, 187, 0, 0.15);
            padding: 24px;
            box-sizing: border-box;
            text-align: center;
            color: #fff;
        }
        .station-header {
            font-size: 15px;
            color: #ffbb00;
            font-weight: 900;
            margin-bottom: 16px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 0 10px rgba(255, 187, 0, 0.6);
        }
        .screen-container {
            width: 100%;
            height: 130px;
            background: #000;
            border-radius: 12px;
            border: 1px solid #ff7700;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-bottom: 16px;
            position: relative;
            overflow: hidden;
            box-shadow: inset 0 0 20px rgba(0,0,0,0.9);
        }
        .wave-bars {
            display: flex;
            gap: 6px;
            align-items: flex-end;
            height: 50px;
            margin-bottom: 10px;
        }
        .bar {
            width: 7px;
            background: linear-gradient(to top, #ff4500, #ffbb00);
            height: 10px;
            border-radius: 3px;
            box-shadow: 0 0 10px #ff7700;
            transition: height 0.2s ease;
        }
        .playing .bar {
            animation: pulseWave 0.7s infinite alternate ease-in-out;
        }
        .playing .bar:nth-child(1) { animation-delay: 0.1s; }
        .playing .bar:nth-child(2) { animation-delay: 0.3s; }
        .playing .bar:nth-child(3) { animation-delay: 0.5s; }
        .playing .bar:nth-child(4) { animation-delay: 0.2s; }
        .playing .bar:nth-child(5) { animation-delay: 0.4s; }

        @keyframes pulseWave {
            0% { height: 10px; }
            100% { height: 50px; }
        }

        .status-text {
            font-size: 12px;
            color: #ffbb00;
            font-weight: bold;
            letter-spacing: 1.5px;
        }

        .info-box {
            font-size: 13px;
            color: #dddddd;
            background: rgba(255, 119, 0, 0.1);
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 18px;
            border: 1px solid rgba(255, 187, 0, 0.3);
        }
        .controls {
            display: flex;
            justify-content: center;
            gap: 14px;
        }
        button {
            background: linear-gradient(135deg, #ff7700, #ffbb00);
            color: #000;
            border: none;
            padding: 12px 28px;
            font-weight: 900;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s ease;
            box-shadow: 0 0 15px rgba(255, 119, 0, 0.5);
            text-transform: uppercase;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 0 22px #ffbb00;
        }
    </style>
</head>
<body>

    <div class="cyber-card" id="playerCard">
        <div class="station-header">Radio Catrachos de Corazon</div>
        
        <div class="screen-container">
            <div class="wave-bars">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
            <div class="status-text" id="statusLabel">SISTEMA EN ESPERA</div>
        </div>

        <div class="info-box" id="songInfo">Conectado a servidor seguro</div>

        <div class="controls">
            <button onclick="playRadio()">▶ PLAY</button>
            <button onclick="stopRadio()">⏹ STOP</button>
        </div>
    </div>

    <audio id="radioStream" src="https://radio.technoplayerserver.com/8010/stream"></audio>

    <script>
        const audio = document.getElementById('radioStream');
        const songInfo = document.getElementById('songInfo');
        const statusLabel = document.getElementById('statusLabel');
        const playerCard = document.getElementById('playerCard');

        function playRadio() {
            audio.play().catch(e => console.log("Error:", e));
            songInfo.innerText = "Transmisión en vivo activada";
            statusLabel.innerText = "EN DIRECTO";
            playerCard.classList.add('playing');
        }

        function stopRadio() {
            audio.pause();
            audio.currentTime = 0;
            songInfo.innerText = "Transmisión detenida";
            statusLabel.innerText = "SISTEMA EN ESPERA";
            playerCard.classList.remove('playing');
        }
    </script>
</body>
</html>
