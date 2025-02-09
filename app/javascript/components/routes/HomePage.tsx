import { useState } from "react";
import Button from "src/components/Button/component";

const HomePage = () => {
  const [counter, setCouter] = useState(0);

  const handleAdd = () => {
    setCouter(counter + 1);
  };

  return (
    <div className="flex flex-col h-full w-full items-center justify-center">
      <div className="flex flex-col w-3xs items-center">
        <h1 className="text-3xl font-bold underline">ScanStocker</h1>
        <p>{counter}</p>
        <Button onClick={handleAdd}>+1</Button>
        <Button variant="primary" shouldFitContainer onClick={handleAdd}>
          +1
        </Button>
        <Button variant="secondary" onClick={handleAdd}>
          +1
        </Button>
        <Button variant="warning" onClick={handleAdd}>
          +1
        </Button>
        <Button variant="destructive" onClick={handleAdd}>
          +1
        </Button>
      </div>
    </div>
  );
};

export default HomePage;
