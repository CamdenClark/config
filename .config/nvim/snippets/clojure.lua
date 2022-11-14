return {
	s("defnc", {
		t("(defnc "), i(1),
		t({ "", "[{:keys [" }), i(2), t({ "]}]", "" }),
		t("(d/div "), i(3), t(")"),
		t({ "", ")" })
	})
}
