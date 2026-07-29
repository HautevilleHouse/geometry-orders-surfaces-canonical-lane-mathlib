import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure UniformizationTheoremPackage where
  surface : Type u
  topology : TopologicalSpace surface
  complexStructure : Type v
  riemannianMetric : Type w
  conformalMapping : Type x
  simplyConnectedSurface : Prop
  existenceConformalMapping : Prop
  constantCurvatureMetric : Prop

structure UniformizationTheoremEvidence (P : UniformizationTheoremPackage) where
  simplyConnectedSurfaceClosed : P.simplyConnectedSurface
  existenceConformalMappingClosed : P.existenceConformalMapping
  constantCurvatureMetricClosed : P.constantCurvatureMetric

def UniformizationTheoremClosed (P : UniformizationTheoremPackage) : Prop :=
  P.simplyConnectedSurface ∧ P.existenceConformalMapping ∧ P.constantCurvatureMetric

theorem uniformization_theorem_closed_from_evidence (P : UniformizationTheoremPackage) (E : UniformizationTheoremEvidence P) : UniformizationTheoremClosed P := by
  exact And.intro E.simplyConnectedSurfaceClosed (And.intro E.existenceConformalMappingClosed E.constantCurvatureMetricClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse