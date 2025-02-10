import Button from "../Button/component";

import { VideoFeed, PhotoCaptureCanvas } from "./components";
import { useQrReader } from "./hooks/useQrReader";
import { useVideoFeed } from "./hooks/useVideoFeed";

const QRCodeScanner = () => {
  const { videoRef } = useVideoFeed();
  const { canvasRef, takePhoto, qrCodeUrl } = useQrReader(videoRef);

  return (
    <div>
      <VideoFeed videoRef={videoRef} />
      <Button onClick={takePhoto} shouldFitContainer>
        Add to Cart
      </Button>
      <PhotoCaptureCanvas canvasRef={canvasRef} />
      {qrCodeUrl}
    </div>
  );
};

export default QRCodeScanner;
