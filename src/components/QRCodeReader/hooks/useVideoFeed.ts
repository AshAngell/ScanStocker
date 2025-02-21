import { useRef, useEffect } from "react";

export const useVideoFeed = () => {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const startVideo = async () => {
      try {
        // Request video stream with explicit constraints
        const stream = await navigator.mediaDevices.getUserMedia({
          video: {
            facingMode: "environment", // Ensures front camera usage on mobile
            width: { ideal: 1280 }, // Adjust resolution
            height: { ideal: 720 },
          },
        });

        if (videoRef.current) {
          videoRef.current.srcObject = stream;
          videoRef.current.play(); // Ensure playback starts
          videoRef.current.playsInline = true; // Required for iOS
        }
      } catch (error) {
        console.error("Error accessing camera:", error);
      }
    };

    startVideo();

    return () => {
      if (videoRef.current?.srcObject) {
        const stream = videoRef.current.srcObject as MediaStream;
        stream.getTracks().forEach((track) => track.stop());
      }
    };
  }, []);

  return {
    videoRef,
  };
};
