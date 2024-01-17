import '../models/flash_card.dart';

final List<flashCard> ChemistryFlashCards = [
  flashCard(question: "Chemical Formula of Water", answer: "H₂O"),
  flashCard(
      question: "Balanced Equation for Photosynthesis",
      answer: "6CO₂ + 6H₂O → C₆H₁₂O₆ + 6O₂"),
  flashCard(question: "Ideal Gas Law Equation", answer: "PV = nRT"),
  flashCard(question: "Schrodinger's Wave Equation", answer: "Ψ = Ψ(x, t)"),
  flashCard(
      question: "Bohr's Model for Hydrogen Atom", answer: "E = -13.6eV / n²"),
  flashCard(
      question: "Heisenberg's Uncertainty Principle",
      answer: r"""\[ \Delta x \cdot \Delta p \geq \frac{\hbar}{2} \]"""),
  flashCard(question: "Avogadro's Law", answer: "V ∝ n"),
  flashCard(question: "Rate of Reaction Formula", answer: "Rate = k[A][B]"),
  flashCard(question: "Ohm's Law", answer: "V = IR"),
  flashCard(question: "Half-Life Formula", answer: "N(t) = N₀(1/2)^(t/T½)"),
];

final List<flashCard> JavaFlashCards = [
  flashCard(
      question: "What is an Object in Java?",
      answer: "An instance of a class, encapsulating data and behavior."),
  flashCard(
      question: "What is Inheritance?",
      answer:
          "The process where one class acquires the properties and behaviors of another class."),
  flashCard(
      question: "What is a Constructor?",
      answer: "A special method used to initialize objects."),
  flashCard(
      question: "What is the 'this' keyword?",
      answer: "Refers to the current object in a method or constructor."),
  flashCard(
      question: "What is the 'super' keyword?",
      answer: "Refers to the immediate parent class object."),
  flashCard(
      question: "What is the purpose of the 'finalize' method?",
      answer: "Called by the garbage collector before an object is reclaimed."),
  flashCard(
      question: "What is the difference between '==' and '.equals()'?",
      answer:
          "'==' compares object references, '.equals()' compares object contents."),
];

final List<flashCard> MathFlashCards = [
  flashCard(question: "Area of a Circle", answer: r"""\[ A = \pi r^2 \]"""),
  flashCard(
      question: "Pythagorean Theorem",
      answer: r"""\[ c = \sqrt{a^2 + b^2} \]"""),
  flashCard(
      question: "Quadratic Formula",
      answer: r"""\[ x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} \]"""),
  flashCard(
      question: "Einstein's Mass-Energy Equivalence",
      answer: r"""\[ E=mc^2 \]"""),
  flashCard(
      question: "Binomial Coefficient Formula",
      answer: r"""\[ C(n, k) = \frac{n!}{k!(n-k)!} \]"""),
  flashCard(
      question: "Law of Cosines",
      answer: r"""\[ c^2 = a^2 + b^2 - 2ab\cos(C) \]"""),
  flashCard(
      question: "Gaussian Integral",
      answer: r"""\[ \int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi} \]"""),
  flashCard(
      question: "Fourier Transform",
      answer:
          r"""\[ F(\omega) = \int_{-\infty}^{\infty} f(t) e^{-j\omega t} \, dt \]"""),
  flashCard(question: "Hubble's Law", answer: r"""\[ v = H_0 D \]"""),
  flashCard(
      question: "Schwarzschild Radius",
      answer: r"""\[ r_s = \frac{2GM}{c^2} \]"""),
];

final List<flashCard> MechanicsFlashCards = [
  flashCard(
      question: "Newton's First Law of Motion",
      answer: r"""\[ \sum F = 0 \Rightarrow \text{Constant Velocity} \]"""),
  flashCard(
      question: "Work-Energy Theorem", answer: r"""\[ W = \Delta KE \]"""),
  flashCard(
      question: "Centripetal Force",
      answer: r"""\[ F_c = \frac{m v^2}{r} \]"""),
  flashCard(
      question: "Torque Formula",
      answer: r"""\[ \tau = r \times F \times \sin(\theta) \]"""),
  flashCard(
      question: "Projectile Motion",
      answer: r"""\[ y(t) = v_0 \sin(\theta)t - \frac{1}{2}gt^2 \]"""),
  flashCard(question: "Angular Momentum", answer: r"""\[ L = I \omega \]"""),
  flashCard(question: "Hooke's Law", answer: r"""\[ F = -kx \]"""),
  flashCard(
      question: "Escape Velocity",
      answer: r"""\[ v_e = \sqrt{\frac{2GM}{r}} \]"""),
];

final List<flashCard> PhysicsFlashCards = [
  flashCard(question: "Planck's Law", answer: r"""\[ E = hf \]"""),
  flashCard(
      question: "Schrodinger Equation",
      answer: r"""\[ i\hbar \frac{\partial}{\partial t} \Psi = H \Psi \]"""),
  flashCard(
      question: "Heisenberg's Uncertainty Principle",
      answer: r"""\[ \Delta x \cdot \Delta p \geq \frac{\hbar}{2} \]"""),
  flashCard(question: "Relativity Equations", answer: r"""\[ E = mc^2 \]"""),
  flashCard(question: "Maxwell's Equations", answer: r"""\[
        \begin{align*}
          \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
          \nabla \cdot \mathbf{B} &= 0 \\
          \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
          \nabla \times \mathbf{B} &= \mu_0 \mathbf{J} + \mu_0 \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t}
        \end{align*}
      \]
      """),
];

final Map<String, List<flashCard>> subjectFlashCards = {
  'Chemistry': ChemistryFlashCards,
  'Java': JavaFlashCards,
  'Math': MathFlashCards,
  'Mechanics': MechanicsFlashCards,
  'Physics': PhysicsFlashCards,
};
