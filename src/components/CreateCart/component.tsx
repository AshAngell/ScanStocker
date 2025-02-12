import Button from "src/components/Button/component";
import { v4 } from "uuid";

const CreateCart = ({
  setCartId,
}: {
  setCartId: React.Dispatch<React.SetStateAction<string | null | undefined>>;
}) => {
  const createCart = () => {
    setCartId(v4());
  };

  return <Button onClick={createCart}>Create New Cart</Button>;
};

export default CreateCart;
