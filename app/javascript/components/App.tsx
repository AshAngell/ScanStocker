import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { HomePage } from "./routes";
import AppWrapper from "src/components/AppWrapper/component";

const App = () => {
  return (
    <AppWrapper>
      <Router>
        <Routes>
          <Route path="/" element={<HomePage />} />
        </Routes>
      </Router>
    </AppWrapper>
  );
};

export default App;
