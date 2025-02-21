import Button from "../Button/component";
import { useAsync } from "react-use";
import axios from "axios";

import { VideoFeed, PhotoCaptureCanvas } from "./components";
import { useQrReader } from "./hooks/useQrReader";
import { useVideoFeed } from "./hooks/useVideoFeed";
import { useEffect } from "react";

const QRCodeScanner = ({ cartId }: { cartId: string | undefined | null }) => {
  const { videoRef } = useVideoFeed();
  const { canvasRef, takePhoto, qrCodeUrl, resetQrCodeUrl } =
    useQrReader(videoRef);

  const addToCartPost = async () => {
    if (qrCodeUrl && cartId) {
      await axios.post(qrCodeUrl, {
        ref_id: cartId,
      });
    }
    resetQrCodeUrl();
  };

  const { loading, error } = useAsync(addToCartPost, [qrCodeUrl, cartId]);

  useEffect(() => {
    resetQrCodeUrl();
  }, [loading]);

  return (
    <div>
      <VideoFeed videoRef={videoRef} />
      <Button onClick={takePhoto} shouldFitContainer>
        Add to Cart test
      </Button>
      <PhotoCaptureCanvas canvasRef={canvasRef} />
      {loading && "posting..."}
      <p>{error?.message}</p>
    </div>
  );
};

export default QRCodeScanner;
