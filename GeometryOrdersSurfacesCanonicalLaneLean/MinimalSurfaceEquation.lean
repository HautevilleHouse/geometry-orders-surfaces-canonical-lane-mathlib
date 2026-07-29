import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure MinimalSurfaceEquationPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  meanCurvature : Type w
  meanCurvatureZero : Prop
  eulerLagrangeEquation : Prop
  jacobiOperator : Type x
  stabilityCondition : Prop
  bernsteinProperty : Prop

structure MinimalSurfaceEquationEvidence (M : MinimalSurfaceEquationPackage) where
  meanCurvatureZeroClosed : M.meanCurvatureZero
  eulerLagrangeEquationClosed : M.eulerLagrangeEquation
  stabilityConditionClosed : M.stabilityCondition
  bernsteinPropertyClosed : M.bernsteinProperty

def MinimalSurfaceEquationClosed (M : MinimalSurfaceEquationPackage) : Prop :=
  M.meanCurvatureZero ∧ M.eulerLagrangeEquation ∧ M.stabilityCondition ∧ M.bernsteinProperty

theorem minimal_surface_equation_closed_from_evidence (M : MinimalSurfaceEquationPackage) (E : MinimalSurfaceEquationEvidence M) :
    MinimalSurfaceEquationClosed M := by
  exact And.intro E.meanCurvatureZeroClosed
    (And.intro E.eulerLagrangeEquationClosed
      (And.intro E.stabilityConditionClosed E.bernsteinPropertyClosed))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse