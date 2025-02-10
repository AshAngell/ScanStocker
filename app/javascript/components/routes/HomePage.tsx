import { useLocalStorage } from "react-use";
import QRCodeScanner from "src/components/QRCodeReader/component";
import CreateCart from "src/components/QRCodeReader/components/CreateCart/component";

const HomePage = () => {
  const [cartId] = useLocalStorage("cart_id", null);

  return (
    <div className="flex flex-col h-full w-full items-center justify-center">
      <div className="flex flex-col w-3xs items-center">
        <h1 className="text-3xl font-bold underline">ScanStocker</h1>
        <CreateCart />
        <p>{cartId}</p>
        <QRCodeScanner />
    <h1>hi</h1>
      </div>
    </div>
  );
};

export default HomePage;
