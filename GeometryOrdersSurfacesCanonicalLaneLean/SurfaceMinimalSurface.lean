import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceMinimalSurfacePackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  meanCurvature : Type w
  minimalSurfaceEquation : Prop
  meanCurvatureZero : Prop
  areaMinimizing : Prop

structure SurfaceMinimalSurfaceEvidence (P : SurfaceMinimalSurfacePackage) where
  minimalSurfaceEquationClosed : P.minimalSurfaceEquation
  meanCurvatureZeroClosed : P.meanCurvatureZero
  areaMinimizingClosed : P.areaMinimizing

def SurfaceMinimalSurfaceClosed (P : SurfaceMinimalSurfacePackage) : Prop :=
  P.minimalSurfaceEquation ∧ P.meanCurvatureZero ∧ P.areaMinimizing

theorem surface_minimal_surface_closed_from_evidence (P : SurfaceMinimalSurfacePackage) (E : SurfaceMinimalSurfaceEvidence P) : SurfaceMinimalSurfaceClosed P := by
  exact And.intro E.minimalSurfaceEquationClosed (And.intro E.meanCurvatureZeroClosed E.areaMinimizingClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse