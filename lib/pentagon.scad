
function pentagon_points(edge=10) = (
    let (a=[0, 0])
    let (b=[a[0] + edge, a[1]])
    let (c=[b[0] + (edge * cos(72)), b[1] + (edge * sin(72))])
    let (d=[c[0] + (edge * cos(144)), c[1] + (edge * sin(144))])
    let (e=[d[0] + (edge * cos(216)), d[1] + (edge * sin(216))])
    [a, b, c, d, e]
);

function pmid(size=10) = (
    let (midx=size / 2)
    let (midy=midx * tan(54))
    [midx, midy]
);

module Pentagon(edge=10) {
    polygon(points=pentagon_points(edge));
}

// test
Pentagon(10);
