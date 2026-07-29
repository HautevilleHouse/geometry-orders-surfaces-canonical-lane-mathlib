import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure EndpointClassificationPackage {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} (R : RauchComparisonPackage C) where
  targetSurface : Type u
  targetTopology : TopologicalSpace targetSurface
  simplyConnectedClosedSurface : Prop
  sphereOrProjectivePlane : Prop
  endpointMatchesClassification : Prop

structure EndpointClassificationEvidence {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} {R : RauchComparisonPackage C} (E : EndpointClassificationPackage R) where
  simplyConnectedClosedSurfaceClosed : E.simplyConnectedClosedSurface
  sphereOrProjectivePlaneClosed : E.sphereOrProjectivePlane
  endpointMatchesClassificationClosed : E.endpointMatchesClassification

def EndpointClassificationClosed {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} {R : RauchComparisonPackage C} (E : EndpointClassificationPackage R) : Prop :=
  E.simplyConnectedClosedSurface ∧ E.sphereOrProjectivePlane ∧ E.endpointMatchesClassification

theorem endpoint_classification_closed_from_evidence
    {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} {R : RauchComparisonPackage C}
    (E : EndpointClassificationPackage R) (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.simplyConnectedClosedSurfaceClosed
    (And.intro Ev.sphereOrProjectivePlaneClosed Ev.endpointMatchesClassificationClosed)

theorem endpoint_classification_supplies_surface_classification
    {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} {R : RauchComparisonPackage C}
    (E : EndpointClassificationPackage R) : E.sphereOrProjectivePlane := E.endpointMatchesClassification

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse