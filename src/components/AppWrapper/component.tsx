import { AppWrapperProps } from "./types";

const AppWrapper = ({ children }: AppWrapperProps) => {
  return <div className="flex-col h-dvh w-dvw bg-blue-100">{children}</div>;
};

export default AppWrapper;
