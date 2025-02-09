export type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  /**
   * The function run when a button is pressed
   */
  onClick: (e?: EventTarget) => void;
  /**
   * The test rendered in the button
   */
  children: string;
  /**
   * The buttons appearance
   * @default "primary"
   */
  variant?: "primary" | "secondary" | "warning" | "destructive";
  /**
   * sets the width of the button to w-100
   * @default false
   */
  shouldFitContainer?: boolean;
};
