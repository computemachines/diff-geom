module MetricCoords2D
export MetricField, Metric, FlatPolarMetric

typealias Metric Array{Float64, 2}
type MetricField
    grid :: Array{Metric, 2}
end

FlatPolarMetric = MetricField(
    [[1 0; 0 1/r^2] for theta=0:360, r=1:100]
)

end
