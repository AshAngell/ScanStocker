import { PhotoCaptureProps } from "./types";

const PhotoCaptureCanvas = ({ canvasRef }: PhotoCaptureProps) => {
  return <canvas ref={canvasRef} style={{ display: "none" }} />;
};

export default PhotoCaptureCanvas;
