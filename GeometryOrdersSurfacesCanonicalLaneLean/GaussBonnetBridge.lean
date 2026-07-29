import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure GaussBonnetPackage (A : AdmissibleClass) where
  surfaceType : Type u
  topology : TopologicalSpace surfaceType
  eulerCharacteristic : ℤ
  totalCurvature : ℝ
  gaussBonnetEquation : totalCurvature = 2 * π * (eulerCharacteristic : ℝ)
  eulerCharacteristicComputed : Prop
  totalCurvatureComputed : Prop

structure GaussBonnetEvidence {A : AdmissibleClass} (G : GaussBonnetPackage A) where
  eulerCharacteristicComputedClosed : G.eulerCharacteristicComputed
  totalCurvatureComputedClosed : G.totalCurvatureComputed
  gaussBonnetEquationClosed : G.gaussBonnetEquation

def GaussBonnetClosed {A : AdmissibleClass} (G : GaussBonnetPackage A) : Prop :=
  G.eulerCharacteristicComputed ∧ G.totalCurvatureComputed

theorem gauss_bonnet_closed_from_evidence {A : AdmissibleClass} (G : GaussBonnetPackage A)
    (E : GaussBonnetEvidence G) : GaussBonnetClosed G := by
  exact And.intro E.eulerCharacteristicComputedClosed E.totalCurvatureComputedClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse