import { useRef, useState } from "react";
import jsQR from "jsqr";

export const useQrReader = (
  videoRef: React.RefObject<HTMLVideoElement | null>,
): {
  canvasRef: React.RefObject<HTMLCanvasElement | null>;
  takePhoto: () => void;
  qrCodeUrl: string | null;
} => {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [qrCodeUrl, setQrCodeUrl] = useState<string>("noQRCode");

  const takePhoto = () => {
    if (videoRef.current && canvasRef.current) {
      const video = videoRef.current;
      const canvas = canvasRef.current;
      const context = canvas.getContext("2d", { willReadFrequently: true });

      if (context) {
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;

        context.drawImage(video, 0, 0, canvas.width, canvas.height);

        const imageData = context.getImageData(
          0,
          0,
          canvas.width,
          canvas.height,
        );
        const code = jsQR(imageData.data, canvas.width, canvas.height);

        if (code) {
          setQrCodeUrl(code.data);
        } else {
          setQrCodeUrl("noQRCode");
        }

        context.reset();
      }
    }
  };

  return { canvasRef, takePhoto, qrCodeUrl };
};
