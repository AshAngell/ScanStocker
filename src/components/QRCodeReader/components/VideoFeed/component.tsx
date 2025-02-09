import { VideoFeedProps } from "./types";

const VideoFeed = ({ videoRef }: VideoFeedProps) => {
  return (
    <video
      ref={videoRef}
      autoPlay
      muted
      style={{
        width: "100%",
        maxWidth: "600px",
        height: "auto",
        borderRadius: "8px",
      }}
    />
  );
};

export default VideoFeed;
