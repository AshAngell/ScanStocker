import Button from "../Button/component";

import { VideoFeed, PhotoCaptureCanvas } from "./components";
import { useQrReader } from "./hooks/useQrReader";
import { useVideoFeed } from "./hooks/useVideoFeed";

const QRCodeScanner = () => {
  const { videoRef } = useVideoFeed();
  const { canvasRef, takePhoto, qrCodeUrl } = useQrReader(videoRef);

  return (
    <div>
      <h2>QR Code Scanner</h2>
      <VideoFeed videoRef={videoRef} />
      <Button onClick={takePhoto} shouldFitContainer>
        Take Photo
      </Button>
      <PhotoCaptureCanvas canvasRef={canvasRef} />
      {qrCodeUrl && (
        <div>
          <h3>QR Code URL:</h3>
          <p>{qrCodeUrl}</p>
        </div>
      )}
    </div>
  );
};

export default QRCodeScanner;
