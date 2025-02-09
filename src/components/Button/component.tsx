import clsx from "clsx";
import { baseStyles, variantStyles } from "./styles";
import { ButtonProps } from "./types";

const Button = ({
  children,
  variant = "primary",
  shouldFitContainer = false,
  onClick,
  ...props
}: ButtonProps) => {
  return (
    <button
      className={clsx(baseStyles, variantStyles[variant], {
        "w-full": shouldFitContainer,
      })}
      onClick={onClick}
      {...props}
    >
      {children}
    </button>
  );
};

export default Button;
