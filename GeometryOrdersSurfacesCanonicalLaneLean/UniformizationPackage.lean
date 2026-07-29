import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure UniformizationPackage where
  surface : Type u
  topology : TopologicalSpace surface
  complexStructure : Type v
  conformalMetric : Type w
  constantCurvatureMetric : Prop
  uniformizationTheorem : Prop

structure UniformizationEvidence (U : UniformizationPackage) where
  constantCurvatureMetricClosed : U.constantCurvatureMetric
  uniformizationTheoremClosed : U.uniformizationTheorem

def UniformizationClosed (U : UniformizationPackage) : Prop :=
  U.constantCurvatureMetric ∧ U.uniformizationTheorem

theorem uniformization_closed_from_evidence (U : UniformizationPackage)
    (E : UniformizationEvidence U) : UniformizationClosed U := by
  exact And.intro E.constantCurvatureMetricClosed E.uniformizationTheoremClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse