local function use_state_fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args -- user_args from opts.user_args 
)
   return 'set-' .. args[1][1]
end

return {
	s("defnc", {
		t("(defnc "), i(1),
		t({ "", "[{:keys [" }), i(2), t({ "]}]", "" }),
		t("(d/div "), i(3), t(")"),
		t({ "", ")" })
	}),
	s("event-fx", {
		t("(reg-event-fx"),
		t({ "", " ::" }), i(1),
		t({ "", " (fn [{:keys [db]} [_ " }), i(2), t("]]"),
		t({ "", "   {:db " }), i(3), t("}"),
		t({ "", "))" })
	}),
	s("defcss", {
		t("(defcss "), i(1),
		t({ "", "{"}), i(3), t({ "}", "" }),
		t(")")
	}),
	s(":keys", {
		t("{:keys ["), i(1), t({ "]}" })
	}),
	s("use-state", {
		t("["), i(1), t(" "), f(use_state_fn, {1}), t("] (hooks/use-state "), i(2), t(")")
	})
}
