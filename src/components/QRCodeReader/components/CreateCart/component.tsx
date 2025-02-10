import { useLocalStorage } from "react-use";
import Button from "src/components/Button/component";
import { v4 } from "uuid";

const CreateCart = () => {
  const [, setCartId] = useLocalStorage<string | null>("card_id", null);

  const createCart = () => {
    setCartId(v4());
  };

  return <Button onClick={createCart}>Create New Cart</Button>;
};

export default CreateCart;
