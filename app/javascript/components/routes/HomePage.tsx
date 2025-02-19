import { useLocalStorage } from "react-use";
import QRCodeScanner from "src/components/QRCodeReader/component";
import CreateCart from "src/components/CreateCart/component";

const HomePage = () => {
  const [cartId, setCartId] = useLocalStorage<string | null>("cart_id", null);

  return (
    <div className="flex flex-col h-full w-full items-center justify-center">
      <div className="flex flex-col w-3xs items-center">
        <h1 className="text-3xl font-bold underline">ScanStocker</h1>
        <CreateCart setCartId={setCartId} />
        <p>{cartId}</p>
        <QRCodeScanner cartId={cartId} />
      </div>
    </div>
  );
};

export default HomePage;
